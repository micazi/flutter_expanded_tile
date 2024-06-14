import 'package:flutter/widgets.dart';

/// A controller for [ExpandedTile].
///
/// An ExpandedTileController would let you control programatically the expansion
/// state of an [ExpandedTile] widget.
///
/// If you are going to use in a ListView builder, assign a controller constructor 'ExpandedTileController()' not an initialized one.
///
///
/// See also:
///
///  * [ExpandedTile], which is the widget this object controls.
///
///
/// {@tool snippet}
///
///
/// ```dart
/// class _ExampleState extends State<Example> {
///
///   late ExpandedTileController _controller;
///
///   void initState() {
///     _controller = ExpandedTileController();
///     super.initState();
///   }
///
///  ExpandedTile(
///  controller: _controller,
///  title:
///  content:
///  ...
/// )
///
/// ```
/// {@end-tool}
class ExpandedTileController extends ChangeNotifier {
  bool _isExpanded;

  /// Getter for the current expansion state of the [ExpandedTile] widget.
  bool get isExpanded => _isExpanded;

  set _setExpanded(bool ex) {
    _isExpanded = ex;
  }

  ExpandedTileController copyWith({
    bool? isExpanded,
  }) {
    return ExpandedTileController(
      isExpanded: isExpanded ?? _isExpanded,
    );
  }

  ExpandedTileController({
    Key? key,
    bool isExpanded = false,
  }) : _isExpanded = isExpanded;

  /// VoidCallback that expands the [ExpandedTile] widget if it is collapsed.
  void expand() {
    _setExpanded = true;
    notifyListeners();
  }

  /// VoidCallback that collapses the [ExpandedTile] widget if it is expanded.
  void collapse() {
    _setExpanded = false;
    notifyListeners();
  }

  /// VoidCallback that toggles the expansion state of the [ExpandedTile] widget.
  void toggle() {
    isExpanded ? collapse() : expand();
  }
}
