import 'package:cook_app_project/src/model/recipeList.dart';
import 'package:flutter/material.dart';

List<String> cook = [];
List<String> cookImg = [];

class RecipeListProvider extends ChangeNotifier {
  late CookListModel cookListModel;

  RecipeListProvider() {
    cookListModel = CookListModel();
  }
  List<String> get cooklist => cookListModel.cookList;

  List<String> cache = [];

  bool loading = false; // 로딩여부

  bool hasMore = true; // 아이템여부

  _makeRequest({
    required int nextId,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    if (nextId == 50) {
      return [];
    }

    return List.generate(5, (index) => cook[nextId + index]);
  }

  fetchItems({
    int? nextId,
  }) async {
    nextId ??= 0;

    loading = true;

    notifyListeners();

    final items = await _makeRequest(nextId: nextId);

    this.cache = [
      ...this.cache,
      ...items,
    ];

    if (items.length == 0) {
      hasMore = false;
    }

    loading = false;

    notifyListeners();
  }
}
