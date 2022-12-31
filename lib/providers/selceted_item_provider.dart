import 'package:flutter/cupertino.dart';

class SelectedItemProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void SelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
