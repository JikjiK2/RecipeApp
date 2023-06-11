import 'package:cook_app_project/src/provider/recipeApi_provider.dart';
import 'package:cook_app_project/src/view/RecipeInfoScreen.dart';
import 'package:cook_app_project/src/view/RecipeSearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<RecipeListProvider>(context, listen: false).fetchItems();
    });
  }

  _renderListView() {
    final provider = Provider.of<RecipeListProvider>(context);

    final cache = provider.cache;

    final loading = provider.loading;

    //로딩중이면서 캐시에 아무것도 없음
    if (loading && cache.length == 0) {
      return Center(
        child: CircularProgressIndicator(
          //backgroundColor: Colors.black,
          color: Colors.black,
        ),
      );
    }

    //로딩중이 아닌데 캐시에 아무것도 없음
    //아무것도 가져올 아이템이 없을때
    if (!loading && cache.length == 0) {
      return Center(
        child: Text('아이템이 없습니다.'),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: cache.length + 1,
      itemBuilder: (context, index) {
        if (index < cache.length) {
          return Card(
            elevation: 2,
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                cardindex = index;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeInfoScreen()));
              },
              child: Container(
                height: 300,
                child: Column(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        // decoration: BoxDecoration(color: Colors.blueAccent),
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Center(
                          child: Image.network("https://fakeimg.pl/500x500"),
                          // Image.network(provider.cookListModel.imgList[index]),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(cache[index].toString(),
                                style: TextStyle(fontSize: 20)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
                          //   child: Text(
                          //     "요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다. 요리 부가 설명입니다.",
                          //     overflow: TextOverflow.ellipsis,
                          //     softWrap: false,
                          //     maxLines: 2,
                          //     style: TextStyle(
                          //       fontSize: 10,
                          //       color: Color.fromRGBO(0, 0, 0, 0.6),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 15.0,
                          // ),
                          // Container(
                          //   child: Row(
                          //     children: [
                          //       Padding(
                          //         padding:
                          //             EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          //         child: Text(
                          //           "작성자",
                          //           overflow: TextOverflow.ellipsis,
                          //           softWrap: false,
                          //           maxLines: 2,
                          //           style: TextStyle(
                          //             fontSize: 12,
                          //             color: Color.fromRGBO(0, 0, 0, 0.9),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (!provider.loading && provider.hasMore) {
          Future.microtask(() {
            provider.fetchItems(nextId: index);
          });
        }

        if (provider.hasMore) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: CircularProgressIndicator(
                //backgroundColor: Colors.black,
                color: Colors.black,
              ),
            ),
          );
        } else {
          return Center(
            child: Text('더이상 아이템이 없습니다.'),
          );
        }
      },
    );
  }

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
            child: _renderListView(),
          ),
        ),
      ),
    );
  }
}
