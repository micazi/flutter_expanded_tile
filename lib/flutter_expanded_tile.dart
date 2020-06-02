library flutter_expanded_tile;

import 'dart:math' as math;

import 'package:flutter/material.dart';

class ExpandedListItem extends StatefulWidget {
  // header
  final Widget leading;
  final Text title;
  final EdgeInsetsGeometry titlePadding;
  final Icon expandIcon;
  final Color headerColor;
  final Color headerSplashColor;
  final bool centerHeaderTitle;
  final EdgeInsetsGeometry headerPadding;
  final bool rotateExpandIcon;
  final Duration expansionDuration;
  final Curve expansionAnimationCurve;
  final Function(bool expanded) expansionListener;

  // Content
  final Widget content;
  final Color contentBackgroundColor;
  final EdgeInsetsGeometry contentPadding;

  const ExpandedListItem({
    key,
    this.leading,
    @required this.title,
    this.titlePadding = const EdgeInsets.all(8),
    this.expandIcon =
    const Icon(Icons.keyboard_arrow_right, color: Colors.black),
    this.headerColor = const Color(0xfffafafa),
    this.headerSplashColor = const Color(0xffeeeeee),
    this.centerHeaderTitle = false,
    this.headerPadding = const EdgeInsets.all(16.0),
    this.rotateExpandIcon = true,
    this.expansionDuration = const Duration(milliseconds: 200),
    this.expansionAnimationCurve = Curves.ease,
    this.expansionListener,
    @required this.content,
    this.contentBackgroundColor = const Color(0xffeeeeee),
    this.contentPadding = const EdgeInsets.all(16.0),
  }) : super(key: key);
  @override
  _ExpandedListItemState createState() => _ExpandedListItemState();
}

class _ExpandedListItemState extends State<ExpandedListItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded;
  @override
  void initState() {
    _isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //* collapsed row
          Material(
            color: widget.headerColor,
            child: InkWell(
              splashColor: widget.headerSplashColor,
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
                if (widget.expansionListener != null)
                  return widget.expansionListener(_isExpanded);
              },
              child: Container(
                padding: widget.headerPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (widget.leading != null) widget.leading,
                    Expanded(
                      child: Container(
                        padding: widget.titlePadding,
                        alignment: widget.centerHeaderTitle
                            ? Alignment.center
                            : Alignment.centerLeft,
                        child: widget.title,
                      ),
                    ),
                    Transform.rotate(
                      angle: widget.rotateExpandIcon
                          ? _isExpanded ? math.pi / 2 : 0
                          : 0,
                      child:
                      widget.expandIcon ?? Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
              ),
            ),
          ),

          AnimatedSize(
            vsync: this,
            duration: widget.expansionDuration,
            curve: widget.expansionAnimationCurve,
            child: Container(
              child: Container(
                child: !_isExpanded
                    ? null
                    : Container(
                    padding: widget.contentPadding,
                    color: widget.contentBackgroundColor,
                    width: double.infinity,
                    child: widget.content),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

