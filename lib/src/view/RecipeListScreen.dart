import 'package:cook_app_project/src/test/test.dart';
import 'package:cook_app_project/src/view/RecipeInfoScreen.dart';
import 'package:cook_app_project/src/view/RecipeSearchScreen.dart';
import 'package:flutter/material.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

//overscroll glow 애니메이션 끄기
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  FocusNode textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            snap: true,
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
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
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
        ],
        body: Center(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeInfoScreen()));
                    },
                    child: Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              decoration:
                                  BoxDecoration(color: Colors.blueAccent),
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Center(
                                child: Text(
                                  "이미지",
                                  style: TextStyle(fontSize: 35),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("요리 이름",
                                      style: TextStyle(fontSize: 23)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
                                  child: Text(
                                    "요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다.",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          "작성자",
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromRGBO(0, 0, 0, 0.9),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => test()));
                    },
                    child: Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              decoration:
                                  BoxDecoration(color: Colors.greenAccent),
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Center(
                                child: Text(
                                  "이미지",
                                  style: TextStyle(fontSize: 35),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("요리 이름",
                                      style: TextStyle(fontSize: 23)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
                                  child: Text(
                                    "요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다.",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          "작성자",
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromRGBO(0, 0, 0, 0.9),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(color: Colors.blueAccent),
                            width: double.maxFinite,
                            height: double.maxFinite,
                            child: Center(
                              child: Text(
                                "이미지",
                                style: TextStyle(fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text("요리 이름",
                                    style: TextStyle(fontSize: 23)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
                                child: Text(
                                  "요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다.",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        "작성자",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 0.9),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration:
                                BoxDecoration(color: Colors.greenAccent),
                            width: double.maxFinite,
                            height: double.maxFinite,
                            child: Center(
                              child: Text(
                                "이미지",
                                style: TextStyle(fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text("요리 이름",
                                    style: TextStyle(fontSize: 23)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
                                child: Text(
                                  "요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다.",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        "작성자",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 0.9),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(color: Colors.blueAccent),
                            width: double.maxFinite,
                            height: double.maxFinite,
                            child: Center(
                              child: Text(
                                "이미지",
                                style: TextStyle(fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text("요리 이름",
                                    style: TextStyle(fontSize: 23)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
                                child: Text(
                                  "요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다.",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        "작성자",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 0.9),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            decoration:
                                BoxDecoration(color: Colors.greenAccent),
                            width: double.maxFinite,
                            height: double.maxFinite,
                            child: Center(
                              child: Text(
                                "이미지",
                                style: TextStyle(fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text("요리 이름",
                                    style: TextStyle(fontSize: 23)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
                                child: Text(
                                  "요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다.",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        "작성자",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 0.9),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
