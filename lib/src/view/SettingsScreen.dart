import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/LoginScreen.dart';
import 'package:cook_app_project/src/view/bottom_navi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  DatabaseProvider? db;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.height;
    final deviceHeight = MediaQuery.of(context).size.width;
    db = Provider.of<DatabaseProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.amber),
                height: 55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 35.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.transparent),
                height: 200,
                child: Column(
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        db!.signOut();
                        showCustom(context, "로그아웃에 성공하셨습니다.");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Bottom_Navi()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                        padding: EdgeInsets.only(left: 15),
                        height: 55,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 20.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "로그아웃",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
