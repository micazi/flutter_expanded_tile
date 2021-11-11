# flutter_expanded_tile

An Expansion tile similar to the list tile supports leading widget,checkbox option and programatic control with content expansion animation.

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

## Demo

![](example/demo.gif)

See Example page for example code.

## Usage

| Property                                        | Description                                                     | Default                     |
| ----------------------------------------------- | --------------------------------------------------------------- | --------------------------- |
| **@required Widget** title                      | Widget representing the title of the tile, mostly a Text widget | **@required**               |
| **@required Widget** content                    | Content which expands                                           | **@required**               |
| **@required ExpandedTileController** controller | Tile Controller                                                 | **@required**               |
| **Widget** leading                              | leading widget before the title                                 | null                        |
| **Widget** trailing                             | ..                                                              | Icon(Icons.chevron_right)   |
| **double** trailingRotation                     | Rotate trailing icon when expanded (in degrees)                 | 90                          |
| **double** contentSeperator                     | Space between header and body                                   | 6.0                         |
| **@required ExpandedTileThemeData** controller  | Tile Theming                                                    | ExpandedTileThemeData()     |
| **Duration** expansionDuration                  | ..                                                              | Duration(milliseconds: 200) |
| **Curve** expansionAnimationcurve               | ..                                                              | Curves.ease                 |

## Contributing

Contributing is more than welcomed on any of my packages/plugins.
I will try to keep adding suggested features as i go.

## Versioning

- **V0.1.0** - Initial Release.
- **V0.2.0** - Added controller for programatic expansion and checkbox functionality.
- **V0.2.1** - Added onChecked callback.
- **V0.3.0** - Added Null Safety, Changed some customization properties, Removed checkbox trailing widget as it is possible to implement with a widget,and fixed some bugs.

## Authors

**Michael Aziz (Micazi)** - [Github](https://github.com/micazi)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
