import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toggle Buttons Example'),
        ),
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool showButtons = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              // Toggle the visibility of additional buttons
              showButtons = !showButtons;
            });
          },
          child: Icon(Icons.add),
        ),
        SizedBox(height: 20),
        // Additional buttons that are displayed when showButtons is true
        if (showButtons) ...[
          FloatingActionButton(
            onPressed: () {
              // Handle button 1 press
            },
            child: Text('Button 1'),
          ),
          FloatingActionButton(
            onPressed: () {
              // Handle button 2 press
            },
            child: Text('Button 2'),
          ),
        ],
      ],
    );
  }
}
