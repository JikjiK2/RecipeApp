import 'package:cook_app_project/src/provider/recipeApi_provider.dart';
import 'package:cook_app_project/src/provider/recipe_provider.dart';
import 'package:flutter/material.dart';

late var cardindex;

class RecipeInfoScreen extends StatefulWidget {
  const RecipeInfoScreen({super.key});

  @override
  State<RecipeInfoScreen> createState() => _RecipeInfoScreenState();
}

//overscroll glow 애니메이션 끄기
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _RecipeInfoScreenState extends State<RecipeInfoScreen> {
  var textLine = 30;
  var textLine2 = 30;

  // late List<bool> _checkBox = [false, false, false, false, false, false];

  // bool _showBackToTopButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
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
            backgroundColor: Colors.transparent,
            floating: true,
            snap: true,
          ),
        ],
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Image.network(cookImg[cardindex]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${cook[cardindex]}",
                                        maxLines: 3,
                                        style: TextStyles.bFont,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "재료",
                                      style: TextStyles.bFont,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () {
                                      if (textLine == 2) {
                                        textLine = 30;
                                      } else {
                                        textLine = 2;
                                      }
                                      setState(() {});
                                    },
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: textLine,
                                      strutStyle: StrutStyle(fontSize: 16.0),
                                      text: TextSpan(
                                          text: "${inList[cardindex]}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            height: 1.4,
                                            fontSize: 16.0,
                                          )),
                                    ),
                                  ),
                                ),
                                // Column(
                                //   children: [
                                //     for (int i = 0; i < 6; i++)
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Row(
                                //             children: [
                                //               Checkbox(
                                //                 activeColor: Colors.black,
                                //                 value: _checkBox[i],
                                //                 onChanged: (value) {
                                //                   setState(() {
                                //                     _checkBox[i] = value!;
                                //                   });
                                //                 },
                                //               ),
                                //               Text(
                                //                 "요리 재료${i + 1}",
                                //                 style: TextStyles.sFont,
                                //               ),
                                //             ],
                                //           ),
                                //           Text(
                                //             "300g",
                                //             style: TextStyles.sFont,
                                //           ),
                                //         ],
                                //       ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Text(
                                  "조리 순서",
                                  style: TextStyles.bFont,
                                ),
                              ],
                            ),
                          ),
                          for (int index = 0;
                              index < MaList[cardindex].length - 1;
                              index++)
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 10.0, 15.0),
                                  child: InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () {
                                      if (textLine2 == 2) {
                                        textLine2 = 30;
                                      } else {
                                        textLine2 = 2;
                                      }
                                      setState(() {});
                                    },
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: textLine2,
                                      strutStyle: StrutStyle(fontSize: 20.0),
                                      text: TextSpan(
                                        text: '${MaList[cardindex][index]}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          height: 1.4,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Image.network("https://fakeimg.pl/300x300"),
                                // Image.network("${MaImg[cardindex][index]}"),
                              ],
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
      ),
      // floatingActionButton: _showBackToTopButton == false
      //     ? null
      //     : Container(
      //         width: 40,
      //         height: 40,
      //         child: FloatingActionButton(
      //           splashColor: Colors.transparent,
      //           onPressed: _scrollToTop,
      //           child: Icon(
      //             Icons.keyboard_arrow_up,
      //           ),
      //           foregroundColor: Color.fromRGBO(255, 255, 255, 0.7),
      //           backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      //         ),
      //       ),
    );
  }
}

class TextStyles {
  static const bFont = TextStyle(fontSize: 30);
  static const mFont = TextStyle(fontSize: 20);
  static const sFont = TextStyle(fontSize: 16);
}
