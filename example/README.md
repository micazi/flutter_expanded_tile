```
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expanded Tile Demo',
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ExpandedListItem(
          leading: Icon(Icons.menu),
          centerHeaderTitle: false,
          title: Text(
            "Lorem ipsum.",
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
          expansionListener: (bool v) {
            log("$v");
          },
          content: Container(
            child: Column(
              children: <Widget>[
                Text("text1"),
                Text("text2"),
              ],
            ),
          ),
          contentBackgroundColor: Colors.green[100],
        ),
      ),
    );
  }
}
```
