import 'package:flutter/material.dart';

class CookListModel with ChangeNotifier {
  List<String> _cookList = [];
  List<String> _imgList = [];

  List<String> get cookList => _cookList;
  List<String> get imgList => _imgList;

  CookListModel() {
    this._cookList = cookList;
  }

  setCookList(List<String> cookList) {
    _cookList = cookList;
    notifyListeners();
  }

  setImgList(List<String> imgList) {
    _imgList = imgList;
    notifyListeners();
  }

  void addCookList(String listitem) {
    _cookList.add(listitem);
    notifyListeners();
  }

  void addImgList(String listitem) {
    _imgList.add(listitem);
    notifyListeners();
  }
}
