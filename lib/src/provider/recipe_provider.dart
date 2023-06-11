import 'package:cook_app_project/src/model/recipe.dart';
import 'package:flutter/material.dart';

List<String> cookName = [];
// List<String> cookImg = [];
List<dynamic> inList = [];
List<dynamic> MaList = [];
List<dynamic> MaImg = [];

class RecipeProvider extends ChangeNotifier {
  late RecipeModel _recipe;

  RecipeProvider() {
    _recipe = RecipeModel();
  }

  String get cook => _recipe.cook;
  String get cookImage => _recipe.cookImage;
  List<String> get ingredientList => _recipe.ingredients;
  List<String> get manualList => _recipe.manual;

  notifyListeners(); // data 가 수정되었다고 알려주기

}
