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
    _controller = ExpandedTileController(isExpanded:true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        //* Seperate usage of a tile.
          Center(
            child: ExpandedTile(
              theme: const ExpandedTileThemeData(
                headerColor: Colors.green,
                headerPadding: EdgeInsets.all(24.0),
                headerSplashColor: Colors.red,
                contentBackgroundColor: Colors.blue,
                contentPadding: EdgeInsets.all(24.0),
                headerBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5),
                        borderRadius: BorderRadius.circular(20),
                ),
                fullExpandedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 4),
                        borderRadius: BorderRadius.circular(2),
                ),
              ),
              controller: _controller,
              title: const Text("this is the title"),
              content: Container(
                color: Colors.red,
                child: const Center(
                  child: Text("This is the content!"),
                ),
              ),
            footer: Text("this is the footer"),
               onTap: () {
            debugPrint("tapped!!");
          },
          onLongTap: () {
            debugPrint("long tapped!!");
          },
            ),
          ),
        //* Starting V0.3.4 : ExpandedTileList.builder widget is available.
        ExpandedTileList.builder(
        itemCount: 3,
        maxOpened: 2,
        reverse: true,
        itemBuilder: (context, index, con) {
          return ExpandedTile(
            theme: const ExpandedTileThemeData(
              initiallyOpenedControllersIndexes: [0,3],
              headerColor: Colors.green,
              headerPadding: EdgeInsets.all(24.0),
              headerSplashColor: Colors.red,
              //
              contentBackgroundColor: Colors.blue,
              contentPadding: EdgeInsets.all(24.0),
            ),
            controller: con,
            title: Text("this is the title $index"),
            content: Container(
              color: Colors.red,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                        "This is the content!"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.collapse();
                    },
                    child: Text("close it!"),
                  )
                ],
              ),
            ),
            onTap: () {
              debugPrint("tapped!!");
            },
            onLongTap: () {
              debugPrint("looooooooooong tapped!!");
            },
          );
        },
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
