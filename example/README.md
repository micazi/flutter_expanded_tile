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
        itemBuilder: (context, index, controller) {
          return ExpandedTile(
            theme: const ExpandedTileThemeData(
              headerColor: Colors.green,
              headerRadius: 24.0,
              headerPadding: EdgeInsets.all(24.0),
              headerSplashColor: Colors.red,
              //
              contentBackgroundColor: Colors.blue,
              contentPadding: EdgeInsets.all(24.0),
              contentRadius: 12.0,
            ),
            controller:
                index == 2 ? controller.copyWith(isExpanded: true) : controller,
            title: Text("this is the title $index"),
            content: Container(
              color: Colors.red,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                        "This is the content!ksdjfl kjsdflk sjdflksjdf lskjfd lsdkfj  ls kfjlsfkjsdlfkjsfldkjsdflkjsfdlksjdflskdjf lksdjflskfjlsfkjslfkjsldfkjslfkjsldfkjsflksjflskjflskfjlsfkjslfkjsflksjflskfjlsfkjslfkjslfkjslfkjslfkjsldfkjsdf"),
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
