import 'package:flutter/material.dart';

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