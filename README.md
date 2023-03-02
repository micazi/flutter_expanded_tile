# flutter_expanded_tile

An Expansion tile similar to the list tile supports leading widget,and programatic control with content expansion animation.

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
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
```

## Example

![](example/demo.gif)

See Example page for example code.

## Usage

### -- ExpandedTile

| Property                                        | Description                                                     | Default                       |
| ----------------------------------------------- | --------------------------------------------------------------- | ----------------------------- |
| **@required Widget** title                      | Widget representing the title of the tile, mostly a Text widget | **@required**                 |
| **@required Widget** content                    | Content which expands                                           | **@required**                 |
| **@required ExpandedTileController** controller | Tile Controller                                                 | **@required**                 |
| **bool** enabled                                | Expandable or not                                               | true                          |
| **VoidCallback** onTap                          | on tap callback                                                 | (){ tileController.toggle();} |
| **VoidCallback** onLongTap                      | on tap and hold callback                                        | (){}                          |
| **Widget** leading                              | leading widget before the title                                 | null                          |
| **Widget** trailing                             | ..                                                              | Icon(Icons.chevron_right)     |
| **double** trailingRotation                     | Rotate trailing icon when expanded (in degrees)                 | 90                            |
| **double** contentseparator                     | Space between header and body                                   | 6.0                           |
| **@required ExpandedTileThemeData** controller  | Tile Theming                                                    | ExpandedTileThemeData()       |
| **bool** disableAnimation                       | Disable Tile Animation                                          | false                         |
| **Duration** expansionDuration                  | ..                                                              | Duration(milliseconds: 200)   |
| **Curve** expansionAnimationcurve               | ..                                                              | Curves.ease                   |

### -- ExpandedTileList.builder()

| Property                                      | Description                                                                            | Default                  |
| --------------------------------------------- | -------------------------------------------------------------------------------------- | ------------------------ |
| **@required int** itemCount                   | count of tiles                                                                         | **@required**            |
| **@required ExpandedTileBuilder** itemBuilder | Function with supplied context,index and controller to return an _ExpandedTile_ widget | **@required**            |
| **bool** reverse                              | reverse list order                                                                     | false                    |
| **EdgeInsetsGeometry** padding                | ListView Padding                                                                       | default ListView Padding |
| **ScrollPhysics** physics                     | leading widget before the title                                                        | default ListView physics |
| **String** restorationId                      | ..                                                                                     | ..                       |
| **int** maxOpened                             | max number of opened tiles at the same time                                            | 1                        |

### -- ExpandedTileList.separated()

    same as the **.builder** constructor but with the added separator builder.

## ToDo list

[x] Adding Null Safety.

[x] Adding Tap Callbacks.

[x] Adding Listview widget with available controller for certain index.

[x] Adding new _separated_ constructor to the **ExpandedTileList** widget.

## Contributing

Contributing is more than welcomed on any of my packages/plugins.
I will try to keep adding suggested features as i go.

## Versioning

- **V0.1.0** - Initial Release.
- **V0.2.0** - Added controller for programatic expansion and checkbox functionality.
- **V0.2.1** - Added onChecked callback.
- **V0.3.0** - Added Null Safety, Changed some customization properties, Removed checkbox trailing widget as it is possible to implement with a widget,and fixed some bugs.
- **V0.3.2** - Added initial expansion state to the controller and Tap callbacks to the widget.
- **V0.3.3** - Added Documentations and refactored code.
- **V0.3.4** - Added ExpandedTileList widget.
- **V0.3.5** - Added ExpandedTileList.separated constructor to the ExpandedTileList widget.
- **V0.3.6** - Added 'Enabled' Property to the Tile.
- **V0.3.7** - Resolved some issues + Added 'disableAnimation' Property to the Tile.

## Authors

**Michael Aziz (Micazi)** - [Github](https://github.com/micazi)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
