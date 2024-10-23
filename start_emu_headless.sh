#!/bin/bash

BL='\033[0;34m'
G='\033[0;32m'
RED='\033[0;31m'
YE='\033[1;33m'
NC='\033[0m' # No Color

emulator_name=${EMULATOR_NAME}

function check_hardware_acceleration() {
    hw_accel_flag="-accel off"  # Always use software acceleration on GitHub Actions
    echo "$hw_accel_flag"
}

hw_accel_flag=$(check_hardware_acceleration)

function launch_emulator () {
  adb devices | grep emulator | cut -f1 | xargs -I {} adb -s "{}" emu kill
  options="@${emulator_name} -no-window -no-snapshot -screen no-touch -noaudio -memory 4096 -no-boot-anim ${hw_accel_flag} -camera-back none

  echo "${OSTYPE}: emulator ${options}"
  nohup emulator $options &

  if [ $? -ne 0 ]; then
    echo "Error launching emulator"
    return 1
  fi
}

function check_emulator_status () {
  sleep 10
  printf "${G}==> ${BL}Checking emulator booting up status 🧐${NC}\n"
  start_time=$(date +%s)
  spinner=( "⠹" "⠺" "⠼" "⠶" "⠦" "⠧" "⠇" "⠏" )
  timeout=${EMULATOR_TIMEOUT:-300}

  until adb wait-for-device; do
      printf "${YE}==> Waiting for ADB to connect... ${spinner[$i]} ${NC}\r"
      i=$(( (i+1) % 8 ))
      sleep 1
  done

  while true; do
    result=$(adb shell getprop sys.boot_completed 2>&1)

    if [ "$result" == "1" ]; then
      printf "\e[K${G}==> \u2713 Emulator is ready : '$result'           ${NC}\n"
      adb devices -l
      adb shell input keyevent 82
      break
    elif [ "$result" == "" ]; then
      printf "${YE}==> Emulator is partially Booted! 😕 ${spinner[$i]} ${NC}\r"
    else
      printf "${RED}==> $result, please wait ${spinner[$i]} ${NC}\r"
      i=$(( (i+1) % 8 ))
    fi

    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ $elapsed_time -gt $timeout ]; then
      printf "${RED}==> Timeout after ${timeout} seconds elapsed 🕛.. ${NC}\n"
      break
    fi
    sleep 4
  done
}

function disable_animation() {
  adb shell "settings put global window_animation_scale 0.0"
  adb shell "settings put global transition_animation_scale 0.0"
  adb shell "settings put global animator_duration_scale 0.0"
}

function hidden_policy() {
  adb shell "settings put global hidden_api_policy_pre_p_apps 1; settings put global hidden_api_policy_p_apps 1; settings put global hidden_api_policy 1"
}

launch_emulator
sleep 2
check_emulator_status
sleep 1
disable_animation
sleep 1
hidden_policy
sleep 1
