library flutter_expanded_tile;

import 'package:flutter/material.dart';

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
    notifyListeners();
  }

  ExpandedTileController({
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
    _setExpanded = !isExpanded;
    notifyListeners();
  }
}

/// Theming data for the [ExpandedTile] widget, Mostly Colors & Spacing.
///
/// {@tool snippet}
///
/// ```dart
/// ExpandedTile(
///  ...
///  theme: ExpandedTileThemeData(
///  headerColor: Colors.green,
/// headerRadius: 24.0,
/// headerPadding: EdgeInsets.all(24.0),
/// headerSplashColor: Colors.red,
/// ),
///
///
///  ...
/// )
///
/// ```
/// {@end-tool}
class ExpandedTileThemeData {
  ////? Header
  final Color? headerColor;
  final Color? headerSplashColor;
  final EdgeInsetsGeometry? headerPadding;
  final double? headerRadius;
  // leading
  final EdgeInsetsGeometry? leadingPadding;
  // title
  final EdgeInsetsGeometry? titlePadding;
  // trailing
  final EdgeInsetsGeometry? trailingPadding;
  ////? Content
  final Color? contentBackgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? contentRadius;
  const ExpandedTileThemeData({
    key,
    this.headerColor = const Color(0xfffafafa),
    this.headerSplashColor = const Color(0xffeeeeee),
    this.headerPadding = const EdgeInsets.all(16.0),
    this.headerRadius = 8.0,
    this.leadingPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 12.0),
    this.trailingPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.contentBackgroundColor = const Color(0xffeeeeee),
    this.contentPadding = const EdgeInsets.all(16.0),
    this.contentRadius = 8.0,
  });
}

/// An Expansion tile similar to the list tile supports leading widget,
/// Trailing widget and programatic control with content expansion animation.
///
///
/// {@tool snippet}
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
///  onTap: (){
/// },
/// onLongTap: (){
/// },
/// theme: ExpandedTileThemeData(),
///  title:
///  content:
///  ...
/// )
///
/// ```
/// {@end-tool}
class ExpandedTile extends StatefulWidget {
////? Header
// Leading
  final Widget? leading; // default is none
// Title
  final Widget title; // required
// Trailing
  final Widget? trailing; // default is chevron icon
  final double? trailingRotation; // default is 90
////? Content
  final Widget content; // required
  final double? contentSeperator; // default is 6.0
////? Misc
  final ExpandedTileThemeData? theme; // default themedata
  final ExpandedTileController controller; // required
  final Curve? expansionAnimationCurve; // default is ease
  final Duration? expansionDuration; // default is 200ms
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  const ExpandedTile({
    key,
////? Header
// Leading
    this.leading,
// Title
    required this.title,
// Trailing
    this.trailing = const Icon(Icons.chevron_right),
    this.trailingRotation = 90,

////? Content
    required this.content,
    this.contentSeperator = 6.0,
////? Misc
    required this.controller,
    this.theme = const ExpandedTileThemeData(),
    this.expansionDuration = const Duration(milliseconds: 200),
    this.expansionAnimationCurve = Curves.ease,
    this.onTap,
    this.onLongTap,
    // Misc
  }) : super(key: key);
  @override
  _ExpandedTileState createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile>
    with SingleTickerProviderStateMixin {
  late ExpandedTileController tileController;
  late bool _isExpanded;
  @override
  void initState() {
    tileController = widget.controller;
    _isExpanded = tileController.isExpanded;
    tileController.addListener(() {
      if (mounted) {
        setState(() {
          _isExpanded = widget.controller.isExpanded;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // tileController.dispose();
    super.dispose();
  }

  double angleToRad(double angle) {
    return angle * 0.0174533;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //* Header
        Material(
          color: widget.theme!.headerColor,
          borderRadius: BorderRadius.circular(widget.theme!.headerRadius!),
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.theme!.headerRadius!),
            splashColor: widget.theme!.headerSplashColor,
            onTap: () {
              tileController.toggle();
              if (widget.onTap != null) {
                return widget.onTap!();
              }
            },
            onLongPress: () {
              if (widget.onLongTap != null) {
                return widget.onLongTap!();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(widget.theme!.headerRadius!),
              ),
              padding: widget.theme!.headerPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  widget.leading != null
                      ? Padding(
                          padding: widget.theme!.leadingPadding!,
                          child: widget.leading,
                        )
                      : Container(),
                  Expanded(
                    child: Container(
                      padding: widget.theme!.titlePadding,
                      child: widget.title,
                    ),
                  ),
                  Transform.rotate(
                    angle: widget.trailingRotation != null
                        ? _isExpanded
                            ? angleToRad(widget.trailingRotation!)
                            : 0
                        : 0,
                    child: Padding(
                      padding: widget.theme!.trailingPadding!,
                      child: widget.trailing,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.contentSeperator,
        ),
        //* Content
        AnimatedSize(
          duration: widget.expansionDuration!,
          curve: widget.expansionAnimationCurve!,
          child: Container(
            child: !_isExpanded
                ? null
                : Container(
                    decoration: BoxDecoration(
                      color: widget.theme!.contentBackgroundColor,
                      borderRadius:
                          BorderRadius.circular(widget.theme!.contentRadius!),
                    ),
                    padding: widget.theme!.contentPadding,
                    width: double.infinity,
                    child: widget.content,
                  ),
          ),
        ),
      ],
    );
  }
}
