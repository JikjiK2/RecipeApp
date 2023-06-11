import 'package:flutter/material.dart';

class RecipeModel extends ChangeNotifier {
  late String _cook;
  late String _cookImage;
  late List<String> _ingredients;
  late List<String> _manual;

  String get cook => _cook;
  String get cookImage => _cookImage;
  List<String> get ingredients => _ingredients;
  List<String> get manual => _manual;

  setIngredientList(List<String> ingredients) {
    _ingredients = ingredients;
    notifyListeners();
  }

  setManualList(List<String> manual) {
    _manual = manual;
    notifyListeners();
  }

  setCook(String cook) {
    _cook = cook;
    notifyListeners();
  }

  setImg(String cookImage) {
    _cookImage = cookImage;
    notifyListeners();
  }
}
