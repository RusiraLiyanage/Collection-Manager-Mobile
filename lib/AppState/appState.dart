import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isDrawerOpen = false;

  bool get isDrawerOpen => _isDrawerOpen;

  void setDrawerState(bool isOpen) {
    _isDrawerOpen = isOpen;
    notifyListeners(); // Notify all listeners about the state change
  }
}
