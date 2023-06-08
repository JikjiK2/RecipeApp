import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 1;
  int get currentPage => _index;

  // page 업데이트
  updateCurrentPage(int index) {
    _index = index;
    notifyListeners();
  }
}
