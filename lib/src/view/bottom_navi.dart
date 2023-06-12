import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/HomeScreen.dart';
import 'package:cook_app_project/src/view/LoginScreen.dart';
import 'package:cook_app_project/src/provider/bottomNavi_provider.dart';
import 'package:cook_app_project/src/view/MyProfileScreen.dart';
import 'package:cook_app_project/src/view/Splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cook_app_project/src/view/RecipeListScreen.dart';

class Bottom_Navi extends StatefulWidget {
  @override
  _Bottom_NaviState createState() => _Bottom_NaviState();
}

class _Bottom_NaviState extends State<Bottom_Navi> {
  DatabaseProvider? db;
  BottomNavigationProvider? bottomNavi;

  List pages = [RecipeListScreen(), HomeScreen(), LoginScreen()];
  List pages2 = [RecipeListScreen(), HomeScreen(), MyProfileScreen()];
  @override
  Widget build(BuildContext context) {
    Future<void> _onBackPressed(BuildContext context) async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('종료하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('돌아가기'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('종료'),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        ),
      );
    }

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    bottomNavi = Provider.of<BottomNavigationProvider>(context);

    return WillPopScope(
        onWillPop: () async {
          await _onBackPressed(context);
          return false;
        },
        child: Scaffold(
          body: auth
              ? pages2[bottomNavi!.currentPage]
              : pages[bottomNavi!.currentPage],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
            child: BottomNavigationBar(
              fixedColor: Colors.black,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              currentIndex: bottomNavi!.currentPage,
              selectedIconTheme:
                  IconThemeData(color: Colors.black), // 선택된 아이콘 스타일
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              selectedLabelStyle:
                  TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.bold), // 선택되지 않은 라벨 스타일
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: bottomNavi!.currentPage == 0
                        ? Icon(Icons.menu_book)
                        : Icon(CupertinoIcons.book),
                    label: "레시피"),
                BottomNavigationBarItem(
                    icon: bottomNavi!.currentPage == 1
                        ? Icon(Icons.home)
                        : Icon(Icons.home_outlined),
                    label: "홈"),
                BottomNavigationBarItem(
                    icon: bottomNavi!.currentPage == 2
                        ? Icon(Icons.person)
                        : Icon(Icons.person_outline),
                    label: "마이프로필"),
              ],
              onTap: (index) {
                bottomNavi!.updateCurrentPage(index);
              },
            ),
          ),
        ));
  }
}
