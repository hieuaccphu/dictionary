import 'package:flutter/material.dart';

class BottomNavBarState extends ChangeNotifier {
  int index = 0;

  void onChanged(int input) {
    index = input;
    notifyListeners();
  }
}
