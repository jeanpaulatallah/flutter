import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';

class FloatingButton extends Home {
  const FloatingButton();
  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
      },
      backgroundColor: Colors.black,
      child: Icon(Icons.add),

    );
  }
}
