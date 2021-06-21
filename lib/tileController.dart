import 'package:flutter/material.dart';

class ExpandedTileController extends ChangeNotifier {
  bool? isExpanded;
  void expand() {
    // need to expand the tile
    isExpanded = true;
    notifyListeners();
  }

  void collapse() {
    isExpanded = false;
    notifyListeners();
    // need to collapse the tile
  }

  void toggle() {
    if (isExpanded == null) isExpanded = false;
    isExpanded = !isExpanded!;
    notifyListeners();
    // need to toggle the tile
  }
}
