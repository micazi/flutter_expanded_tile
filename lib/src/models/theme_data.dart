import 'package:flutter/material.dart';

/// Theming data for the [ExpandedTile] widget, Mostly Colors & Spacing.
///
/// {@tool snippet}
///
/// ```dart
/// ExpandedTile(
///  ...
/// theme: ExpandedTileThemeData(
///   headerColor: Colors.green,
///   headerPadding: EdgeInsets.all(24.0),
///   headerSplashColor: Colors.red,
/// ),
///
///
///  ...
/// )
///
/// ```
/// {@end-tool}
class ExpandedTileThemeData {
  //
  final Color? headerColor;
  final Color? headerSplashColor;
  final Color? contentBackgroundColor;
  final Color? contentSeparatorColor;
  final Color? footerBackgroundColor;
  final Color? footerSeparatorColor;
  //
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? leadingPadding;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? trailingPadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? footerPadding;
  //
  final OutlineInputBorder? headerBorder;
  final OutlineInputBorder? contentBorder;
  final OutlineInputBorder? footerBorder;
  final OutlineInputBorder? fullExpandedBorder;
  //
  const ExpandedTileThemeData({
    key,
    this.headerColor = const Color(0xfffafafa),
    this.headerSplashColor = const Color(0xffeeeeee),
    this.contentBackgroundColor = const Color(0xffeeeeee),
    this.contentSeparatorColor = const Color(0xffeeeeee),
    this.footerBackgroundColor = const Color(0xffeeeeee),
    this.footerSeparatorColor = const Color(0xffeeeeee),
    this.headerPadding = const EdgeInsets.all(16.0),
    this.leadingPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 12.0),
    this.trailingPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.contentPadding = const EdgeInsets.all(16.0),
    this.footerPadding = const EdgeInsets.all(16.0),
    this.headerBorder,
    this.contentBorder,
    this.footerBorder,
    this.fullExpandedBorder,
  });
}
