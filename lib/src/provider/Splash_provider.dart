import 'dart:convert';

import 'package:cook_app_project/src/model/recipeList.dart';
import 'package:cook_app_project/src/provider/recipeApi_provider.dart';
import 'package:cook_app_project/src/provider/recipe_provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SplashProvider extends ChangeNotifier {
  late CookListModel cookListModel;

  SplashProvider() {
    cookListModel = CookListModel();
    checked();
    recipeApi();
  }

  List<String> get cooklist => cookListModel.cookList;

  bool isSplash = true;

  //스플래쉬 화면 지속 시간
  void checked() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      isSplash = false;
      notifyListeners();
    });
  }

  int startindex = 1;
  int endindex = 50;
  Future<void> recipeApi() async {
    var url =
        "https://openapi.foodsafetykorea.go.kr/api/e666ba57d5f848e582aa/COOKRCP01/json/${startindex}/${endindex}";

    Response response = await get(Uri.parse(url));

    final getBody = response.body;
    var parsingData = jsonDecode(getBody);

    int num = int.parse(parsingData["COOKRCP01"]["total_count"]);

    // List<String> temp1 = [];
    // List<String> temp2 = [];

    for (int i = 0; i < endindex; i++) {
      int manualNum = 0;

      for (int k = 1; k < 10; k++) {
        if (parsingData["COOKRCP01"]["row"][i]["MANUAL0${k}"] == "") {
          manualNum = k;
          break;
        }
      }
      if (manualNum == 0) {
        for (int h = 10; h < 21; h++) {
          if (parsingData["COOKRCP01"]["row"][i]["MANUAL${h}"] == "") {
            manualNum = h;
            break;
          }
        }
      }
      cook.add(parsingData["COOKRCP01"]["row"][i]["RCP_NM"]);
      cookImg.add(parsingData["COOKRCP01"]["row"][i]["ATT_FILE_NO_MK"]);
      inList.add(parsingData["COOKRCP01"]["row"][i]["RCP_PARTS_DTLS"]);

      MaList.add(List.generate(manualNum,
          (j) => [parsingData["COOKRCP01"]["row"][i]["MANUAL0${j + 1}"]]));
      MaImg.add(List.generate(manualNum,
          (j) => [parsingData["COOKRCP01"]["row"][i]["MANUAL0${j + 1}"]]));
    }
    print(cook.length);
  }
}
