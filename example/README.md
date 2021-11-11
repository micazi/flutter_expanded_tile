```
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
  late ExpandedTileController _controller;

  void initState() {
    // initialize controller
    _controller = ExpandedTileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Center(
            child: ExpandedTile(
              theme: const ExpandedTileThemeData(
                headerColor: Colors.green,
                headerRadius: 24.0,
                headerPadding: EdgeInsets.all(24.0),
                headerSplashColor: Colors.red,
                contentBackgroundColor: Colors.blue,
                contentPadding: EdgeInsets.all(24.0),
                contentRadius: 12.0,
              ),
              controller: _controller,
              title: const Text("this is the title"),
              content: Container(
                color: Colors.red,
                child: const Center(
                  child: Text("This is the content!"),
                ),
              ),
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
// If you are going to use in a ListView builder, assign a controller constructor [ExpandedTileController()] not an initialized one.
.
.

```
