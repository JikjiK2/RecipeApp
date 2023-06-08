import 'package:flutter/material.dart';

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
  var textLine = 2;
  var textLine2 = 2;

  late List<bool> _checkBox = [false, false, false, false, false, false];

  bool _showBackToTopButton = false;

  // late ScrollController _scrollController;

  // void _scrollToTop() {
  //   _scrollController.jumpTo(0);
  // }

  // @override
  // void initState() {
  //   setState(() {
  //     if (_scrollController.offset >= 400) {
  //       _showBackToTopButton = true; // show the back-to-top button
  //     } else {
  //       _showBackToTopButton = false; // hide the back-to-top button
  //     }
  //   });
  // }

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
                      child: Image.network("https://fakeimg.pl/500x400"),
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
                                    Text(
                                      "요리이름",
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
                                          text:
                                              '요리 설명입니다 요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다요리 설명입니다.',
                                          style: TextStyle(
                                              color: Colors.black,
                                              height: 1.4,
                                              fontSize: 16.0,
                                              fontFamily:
                                                  'NanumSquareRegular')),
                                    ),
                                  ),
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
                                Column(
                                  children: [
                                    for (int i = 0; i < 6; i++)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Checkbox(
                                                activeColor: Colors.black,
                                                value: _checkBox[i],
                                                onChanged: (value) {
                                                  setState(() {
                                                    _checkBox[i] = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                "요리 재료${i + 1}",
                                                style: TextStyles.sFont,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "300g",
                                            style: TextStyles.sFont,
                                          ),
                                        ],
                                      ),
                                  ],
                                )
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
                          for (int i = 0; i < 6; i++)
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 20.0),
                              child: Column(
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
                                          text:
                                              '${i + 1} 번째 조리 내용입니다 조리 내용입니다 조리 내용입니다 조리 내용입니다 조리 내용입니다 조리 내용입니다 조리 내용입니다.',
                                          style: TextStyle(
                                              color: Colors.black,
                                              height: 1.4,
                                              fontSize: 16.0,
                                              fontFamily: 'NanumSquareRegular'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.network("https://fakeimg.pl/300x300"),
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
