//SECTION - Imports
//
//s1 PACKAGES
//---------------
//s2 CORE
import 'package:flutter/material.dart';
//s2 3RD-PARTY
//
//s1 DEPENDENCIES
//---------------
//s2 SERVICES
//s2 MODELS
import '../controller.dart';
import '../models/theme_data.dart';

//s2 MISC
//!SECTION - Imports
//
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
  //SECTION - Widget Arguments
  /// Leading widget of the tile header, default is none.
  final Widget? leading;

  /// Title Widget for the header.
  final Widget title;

  /// Trailing widget of the tile header, default is a chevron arrow icon.
  final Widget? trailing;

  /// The amount of rotation in the trailing widget when collapsing/expanding the tile. default is 90.
  ///
  /// (In angles. e.g 90,180)
  final double? trailingRotation;

  /// Content of the tile when expanded.
  final Widget content;

  /// Height of the separator between the header and the content. default is 6.
  final double? contentseparator;

  /// Constant footer widget to the title.
  final Widget? footer;

  /// Height of the separator between the content and the footer. default is 6.
  final double? footerSeparator;

  /// Is the tile enabled?
  final bool enabled;

  /// Theme data for the tile.
  final ExpandedTileThemeData? theme;

  /// [ExpandedTileController] of the tile.
  final ExpandedTileController controller;

  /// Are animation disabled?
  final bool? disableAnimation;

  /// Curve of the expansion animation. Default is [Curves.ease].
  final Curve? expansionAnimationCurve;

  /// Duration of the expansion animation. Default is 200ms.
  final Duration? expansionDuration;

  /// Void callback for tapping on the tile.
  final VoidCallback? onTap;

  /// Void callback for tapping and holding the tile.
  final VoidCallback? onLongTap;
  //!SECTION
  //
  const ExpandedTile({
    super.key,
    this.leading,
    required this.title,
    this.trailing = const Icon(Icons.chevron_right),
    this.trailingRotation = 90,
    required this.content,
    this.contentseparator = 6.0,
    required this.controller,
    this.footer,
    this.footerSeparator = 6.0,
    this.enabled = true,
    this.theme = const ExpandedTileThemeData(),
    this.disableAnimation = false,
    this.expansionDuration = const Duration(milliseconds: 200),
    this.expansionAnimationCurve = Curves.ease,
    this.onTap,
    this.onLongTap,
  });

  //SECTION - Extra Functionalities
  /// Returns a new [ExpandedTile] widget with the same arguments unless stated otherwise.
  ///
  ///
  ExpandedTile copyWith({
    final Widget? leading,
    final Widget? title,
    final Widget? trailing,
    final double? trailingRotation,
    final Widget? content,
    final double? contentseparator,
    final Widget? footer,
    final bool? enabled,
    final ExpandedTileThemeData? theme,
    final ExpandedTileController? controller,
    final bool? disableAnimation,
    final Curve? expansionAnimationCurve,
    final Duration? expansionDuration,
    final VoidCallback? onTap,
    final VoidCallback? onLongTap,
  }) {
    return ExpandedTile(
      key: key,
      leading: leading ?? this.leading,
      title: title ?? this.title,
      trailing: trailing ?? this.trailing,
      trailingRotation: trailingRotation ?? this.trailingRotation,
      content: content ?? this.content,
      contentseparator: contentseparator ?? this.contentseparator,
      footer: footer ?? this.footer,
      enabled: enabled ?? this.enabled,
      controller: controller ?? this.controller,
      theme: theme ?? this.theme,
      disableAnimation: disableAnimation ?? this.disableAnimation,
      expansionDuration: expansionDuration ?? this.expansionDuration,
      expansionAnimationCurve: expansionAnimationCurve ?? this.expansionAnimationCurve,
      onTap: onTap ?? this.onTap,
      onLongTap: onLongTap ?? this.onLongTap,
    );
  }
  //!SECTION - Extra Functionalities

  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> with SingleTickerProviderStateMixin {
  //
  //SECTION - State Variables
  //s1 --State
  late bool _isExpanded;
  //s1 --State
  //
  //s1 --Controllers
  late ExpandedTileController tileController;
  //s1 --Controllers
  //
  //s1 --Constants
  //s1 --Constants
  //!SECTION

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //s1 --State
    //s1 --State
    //
    //s1 --Controllers & Listeners
    tileController = widget.controller;
    tileController.addListener(() {
      if (mounted) {
        setState(() {
          _isExpanded = tileController.isExpanded;
        });
      }
    });
    //s1 --Controllers & Listeners
    //
    //s1 --Late & Async Initializers
    _isExpanded = tileController.isExpanded;
    //s1 --Late & Async Initializers
    //!SECTION
  }

  //SECTION - Stateless functions
  double angleToRad(double angle) {
    return angle * 0.0174533;
  }
  //!SECTION

  //SECTION - Action Callbacks
  _onTapped() {
    if (widget.enabled) {
      tileController.toggle();
      if (widget.onTap != null) {
        return widget.onTap!();
      }
    }
  }

  _onTapHold() {
    if (widget.enabled) {
      if (widget.onLongTap != null) {
        return widget.onLongTap!();
      }
    }
  }
  //!SECTION

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Return
    return Material(
      color: Colors.transparent,
      shape: _isExpanded && widget.theme?.fullExpandedBorder != null ? widget.theme?.fullExpandedBorder : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //S1  -- Header
          Material(
            color: widget.theme!.headerColor,
            shape: _isExpanded && widget.theme?.fullExpandedBorder != null ? null : widget.theme?.headerBorder,
            borderRadius: _isExpanded && widget.theme?.fullExpandedBorder != null
                ? BorderRadius.vertical(
                    bottom: Radius.zero,
                    top: Radius.circular(widget.theme?.fullExpandedBorder?.borderRadius.topLeft.x ?? 0),
                  )
                : null,
            child: InkWell(
              borderRadius: _isExpanded && widget.theme?.fullExpandedBorder != null
                  ? BorderRadius.vertical(
                      bottom: Radius.zero,
                      top: Radius.circular(widget.theme?.fullExpandedBorder?.borderRadius.topLeft.x ?? 0),
                    )
                  : widget.theme?.headerBorder?.borderRadius ?? BorderRadius.circular(6),
              splashColor: widget.theme!.headerSplashColor,
              onTap: _onTapped,
              onLongPress: _onTapHold,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: widget.theme?.headerBorder?.borderRadius ?? BorderRadius.circular(6),
                ),
                padding: widget.theme!.headerPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          //============================//
          if (_isExpanded)
            SizedBox(
              height: widget.contentseparator,
              child: Container(
                color: widget.theme?.contentSeparatorColor,
              ),
            ),
          //============================//
          //S1  -- Content
          widget.disableAnimation!
              ? Container(
                  child: !_isExpanded
                      ? null
                      : Material(
                          color: widget.theme!.contentBackgroundColor,
                          shape: _isExpanded && widget.theme?.fullExpandedBorder != null ? null : widget.theme?.contentBorder,
                          borderRadius: _isExpanded && widget.theme?.fullExpandedBorder != null
                              ? BorderRadius.vertical(
                                  top: Radius.zero,
                                  bottom: Radius.circular(widget.theme?.fullExpandedBorder?.borderRadius.bottomLeft.x ?? 0),
                                )
                              : null,
                          child: Column(
                            children: [
                              Container(
                                padding: widget.theme!.contentPadding,
                                width: double.infinity,
                                child: widget.content,
                              ),
                            ],
                          ),
                        ),
                )
              : AnimatedSize(
                  duration: widget.expansionDuration!,
                  curve: widget.expansionAnimationCurve!,
                  reverseDuration: widget.expansionDuration!,
                  child: Container(
                    child: !_isExpanded
                        ? null
                        : Material(
                            color: widget.theme!.contentBackgroundColor,
                            shape: _isExpanded && widget.theme?.fullExpandedBorder != null ? null : widget.theme?.contentBorder,
                            borderRadius: _isExpanded && widget.theme?.fullExpandedBorder != null && widget.footer == null
                                ? BorderRadius.vertical(
                                    top: Radius.zero,
                                    bottom: Radius.circular(widget.theme?.fullExpandedBorder?.borderRadius.bottomLeft.x ?? 0),
                                  )
                                : null,
                            child: Column(
                              children: [
                                Container(
                                  padding: widget.theme!.contentPadding,
                                  width: double.infinity,
                                  child: widget.content,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
          //============================//
          if (widget.footer != null)
            SizedBox(
              height: widget.footerSeparator,
              child: Container(
                color: widget.theme?.footerSeparatorColor,
              ),
            ),
          //============================//
          //S1  -- Footer
          if (widget.footer != null)
            Material(
              color: widget.theme!.footerBackgroundColor,
              shape: _isExpanded && widget.theme?.fullExpandedBorder != null ? null : widget.theme?.footerBorder,
              borderRadius: _isExpanded && widget.theme?.fullExpandedBorder != null
                  ? BorderRadius.vertical(
                      top: Radius.zero,
                      bottom: Radius.circular(widget.theme?.fullExpandedBorder?.borderRadius.bottomLeft.x ?? 0),
                    )
                  : null,
              child: Container(
                padding: widget.theme!.footerPadding,
                width: double.infinity,
                child: widget.footer!,
              ),
            ),
        ],
      ),
    );
    //!SECTION
  }
}
