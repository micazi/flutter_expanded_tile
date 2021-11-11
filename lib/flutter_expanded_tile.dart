library flutter_expanded_tile;

import 'package:flutter/material.dart';
import 'tileController.dart';
import 'tileThemeData.dart';
//
export 'tileController.dart';
export 'tileThemeData.dart';

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
    tileController.addListener(() {
      if (mounted) {
        setState(() {
          _isExpanded = tileController.isExpanded;
        });
      }
    });
    _isExpanded = false;
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
