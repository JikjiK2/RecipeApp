import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

List<String> cookList = [];

Future<void> recipeApi() async {
  int endindex = 20;

  var url =
      "https://openapi.foodsafetykorea.go.kr/api/e666ba57d5f848e582aa/COOKRCP01/json/1/${endindex}";

  Response response = await get(Uri.parse(url));

  final getBody = response.body;
  var parsingData = jsonDecode(getBody);

  int manualNum = 0;

  for (int i = 1; i < 10; i++) {
    if (parsingData["COOKRCP01"]["row"][0]["MANUAL0${i}"] == "") {
      manualNum = i - 1;
      break;
    }
  }
  if (manualNum == 0) {
    for (int i = 10; i < 21; i++) {
      if (parsingData["COOKRCP01"]["row"][0]["MANUAL${i}"] == "") {
        manualNum = i - 1;
        break;
      }
    }
  }
  int num = int.parse(parsingData["COOKRCP01"]["total_count"]);
  for (int i = 0; i < endindex; i++) {
    // print(parsingData["COOKRCP01"]["row"][i]["RCP_NM"]);
    cookList.add(parsingData["COOKRCP01"]["row"][i]["RCP_NM"]);
  }
  for (int i = 0; i < endindex; i++) {
    print(cookList[i]);
  }
  // print(parsingData["COOKRCP01"]["row"][0]["RCP_PARTS_DTLS"]);
  // print(parsingData["COOKRCP01"]["row"][0]["HASH_TAG"]);
  // print(manualNum);
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            leading: const BackButton(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            floating: true,
            snap: true,
          ),
        ],
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.amberAccent),
                    width: double.maxFinite,
                    height: 250,
                    child: TextButton(
                      onPressed: () {
                        recipeApi();
                      },
                      child: Text("버튼눌러"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
