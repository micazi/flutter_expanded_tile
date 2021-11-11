// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ExpandedTileController extends ChangeNotifier {
  bool isExpanded = false;

  void expand() {
    isExpanded = true;
    notifyListeners();
  }

  void collapse() {
    isExpanded = false;
    notifyListeners();
  }

  void toggle() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
