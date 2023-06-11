import 'package:cook_app_project/src/provider/recipeApi_provider.dart';
import 'package:cook_app_project/src/view/RecipeInfoScreen.dart';
import 'package:cook_app_project/src/view/RecipeSearchScreen.dart';
import 'package:cook_app_project/src/view/Splash.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                splashColor: Colors.transparent,
                splashRadius: 25,
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                focusNode: textFocus,
                onTap: () {
                  textFocus.unfocus();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeSearchScreen()));
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(125, 125, 125, 0.4),
                            width: 2.0)),
                    hintText: "검색"),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(
              style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.amber,
                child: Center(
                  child: Text("이미지"),
                  // Image.network("${cookImg[random]}"),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "- 랜덤 추천 요리 -",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "${cook[random]}",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black),
                onPressed: () {
                  cardindex = random;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeInfoScreen()));
                },
                child: Text(
                  "추천 레시피 보러가기",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
