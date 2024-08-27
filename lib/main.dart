import 'package:flutter/material.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/floating_action_button.dart';
import 'package:flutter/services.dart';

final fontFam ='TitilliumWeb';


void main() => runApp(const MaterialApp(
      home: Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollController = ScrollController();
  int flutterLevel = 0;
  String mail = "atallahjeanpaul@gmail.com";
  TextEditingController textFieldController = TextEditingController();
  String hint = 'Change email';
  bool showButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black54, // You can set this separately for the header
              ),
              child: Text('Drawer Header',
              style: TextStyle(
                color: Colors.white,
              ),),
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Handle onTap
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Handle onTap
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
      appBar: AppBar(
        // title:  Text('Get to know me',
        //   style: TextStyle(
        //       wordSpacing: 2,
        //       fontFamily: fontFam,
        //       fontWeight: FontWeight.bold ,
        //       color: Colors.white),
        // ),
        // centerTitle: true,
        backgroundColor: Colors.grey[900],
        
        elevation: 0,
      ),


      body: SingleChildScrollView( controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 10,),
            Row(
              children:  [
                 CircleAvatar(
                  backgroundImage:AssetImage('assets/jp.jpeg'),
                  radius: 40,
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Jean-Paul Atallah',
                    style: TextStyle(
                      fontFamily: fontFam,
                      color: Colors.blue,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ],
                )
              ],
            ),
            Divider(
              height: 20,
              color: Colors.grey[800],
            ),

            // Text(
            //     'NAME',
            //     style: TextStyle(
            //       fontFamily: fontFam,
            //       color: Colors.grey,
            //       letterSpacing: 2.0,
            //     ),
            // ),
            // Text(
            //   'Jean-Paul',
            //   style: TextStyle(
            //     fontFamily: fontFam,
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.blue,
            //   ),
            // ),
            // Divider(
            //   height: 20,
            //   color: Colors.grey[800],
            // ),
            Text(
              'FLUTTER EXPERIENCE',
              style: TextStyle(
                fontFamily: fontFam,
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),

            Text(
              '$flutterLevel',
              style: TextStyle(
                fontFamily: fontFam,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            Divider(
              height: 20,
              color: Colors.grey[800],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Icon(
                    Icons.email,
                    color: Colors.grey[400]
                ),
                const SizedBox(width: 10,),
                Text(
                  mail,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: fontFam,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                )
              ],
            ),

            SizedBox(height: 10,),

            Divider(
              height: 20,
              color: Colors.grey[800],
            ),

            Row(
              children: [
                GestureDetector( onTap: () {
                  print('phone');
                },
                child:
                Icon(
                  Icons.phone,
                  color: Colors.grey[400],
                ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    print('number');
                  },
                  child:
                  Text(
                    '+961 76 507 454',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: fontFam,
                      fontSize: 20,

                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    flutterLevel = 0;
                    mail = 'atallahjeanpaul@gmail.com';
                  });
                },
                key: Key('reset_button_key'),
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontFamily: fontFam,
                  ),
                )
            ),
            TextField(
              key: Key('text_field_key'),
              controller: textFieldController,
              onChanged: (value) {
                setState(() {
                });
              },
              textAlign: TextAlign.left,
              cursorColor: Colors.blue,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z1-90]+')),
              ],
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                )
              ),
              keyboardType: TextInputType.text,
              onTap: () {
                setState(() {
                  hint = '';
                });
              },
              style: TextStyle(
                color: Colors.blue,
                fontFamily: fontFam,
              ),
            ),
            RaisedButton(

              onPressed:  () {
              setState(() {
                mail = textFieldController.text;
                textFieldController.clear();
              });
            },
              key: const Key('submit_button_key'),
              color: Colors.blue,
              child: Text(
                'Submit',
                style: TextStyle(
                  fontFamily: fontFam,
                ),
              ),
            )
          ],
        ),
      ),
      ),
        //floatingActionButton: const FloatingButton(),
        //bottomNavigationBar: const Bar(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showButtons = !showButtons;
            flutterLevel += 1;
          });
        },
        key: const Key('add_key'),
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}

