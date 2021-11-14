// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ExpandedTileController extends ChangeNotifier {
  bool _isExpanded;
  bool get isExpanded => _isExpanded;

  set _setExpanded(bool ex) {
    _isExpanded = ex;
    notifyListeners();
  }

  ExpandedTileController({
    bool isExpanded = false,
  }) : _isExpanded = isExpanded;

  void expand() {
    _setExpanded = true;
    notifyListeners();
  }

  void collapse() {
    _setExpanded = false;
    notifyListeners();
  }

  void toggle() {
    _setExpanded = !isExpanded;
    notifyListeners();
  }
}
