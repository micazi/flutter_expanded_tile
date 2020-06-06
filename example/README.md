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
  // Controller
  ExpandedTileController _controller;

  void initState() {
    // initialize controller
    _controller = ExpandedTileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ExpandedTile(
                controller: _controller,
                checkable: false, // check box enabled or not
                leading: Icon(Icons.menu),
                centerHeaderTitle: false,
                title: Text(
                  "With Leading.",
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
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

.
.
// Controller has
Expand function
Collapse function
Toggle function
isExpanded parameter to get tile state.
.
.

```
