# flutter_expanded_tile

An Expansion tile similar to the list tile supports leading widget with content expansion animation.

## Getting Started

### 1. Depend on it

Add this to your package's pubspec.yaml file:

```
dependencies:
  flutter_expanded_tile: [latest version]
```

### 2. Install it

```
$ flutter pub get
```

### 3. Import it

```
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
```

## Example

Use as you would use an ordinary list tile.

```
.
.
ExpandedListItem(
          title: Text(
            "Lorem ipsum.",
            style: TextStyle(color: Colors.red),
          ),
          content: Container(
              child: Column(
            children: <Widget>[
                Text("text1"),
                Text("text2"),
            ],
          ),
          ),
          leading: Icon(Icons.menu),
          centerHeaderTitle: false,
           expansionListener: (v) {
             log("$v");
           },
        ),
.
.

```

## Usage

| Property                              | Description                                    | Default                                               |
| ------------------------------------- | ---------------------------------------------- | ----------------------------------------------------- |
| **@required Text** title              | Text Widget representing the title of the tile | **@required**                                         |
| **@required Widget** content          | Content which expands                          | **@required**                                         |
| **Widget** leading                    | leading widget before the title                | null                                                  |
| **Icon** expandedIcon                 | ..                                             | Icon(Icons.keyboard_arrow_right, color: Colors.black) |
| **bool** centerTitle                  | ..                                             | false                                                 |
| **bool** rotateExpandedIcon           | ..                                             | true                                                  |
| **Color** headerColor                 | ..                                             | Color(0xfffafafa)                                     |
| **Color** headerSplashColor           | ..                                             | Color(0xffeeeeee)                                     |
| **Color** contentBackgroundColor      | ..                                             | Color(0xffeeeeee)                                     |
| **EdgeInsetsGeometry** titlePadding   | ..                                             | EdgeInsets.all(8)                                     |
| **EdgeInsetsGeometry** headerPadding  | ..                                             | EdgeInsets.all(16.0)                                  |
| **EdgeInsetsGeometry** contentPadding | ..                                             | EdgeInsets.all(16.0)                                  |
| **Duration** expansionDuration        | ..                                             | Duration(milliseconds: 200)                           |
| **Curve** expansionAnimationcurve     | ..                                             | Curves.ease                                           |
| **Function(bool)** expansionListener  | a callback for when the header is clicked      | null                                                  |

## Built With

- Flutter - Beatiful native apps in record time.
- Android Studio - Tools for building apps on every type of Android device.
- Visual Studio Code - Code editing. Redefined.

## Contributing

Contributing is more than welcomed on any of my packages/plugins.
I will try to keep adding suggested features as i go.

## Versioning

- **V0.1.0** - Initial Release.

## Authors

**Michael Aziz** - [Github](https://github.com/micwaziz)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
