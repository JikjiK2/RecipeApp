import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  DatabaseProvider? db;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.height;
    final deviceHeight = MediaQuery.of(context).size.width;
    db = Provider.of<DatabaseProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.amber),
              height: deviceHeight - 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 35.0,
                      ),
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SettingsScreen()))
                      },
                    ),
                  ]),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2.0, color: Colors.black),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 70,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                          child: Row(
                            children: [
                              Container(
                                child: Consumer<DatabaseProvider>(
                                  builder: (_, user, __) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${user.name}",
                                            style: TextStyle(fontSize: 22),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${user.email}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${user.nickname}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
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
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.only(left: 15),
                      height: 55,
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "공지",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      padding: EdgeInsets.only(left: 15),
                      height: 55,
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "문의",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                          top: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      padding: EdgeInsets.only(left: 15),
                      height: 55,
                      child: Row(
                        children: [
                          Icon(
                            Icons.turned_in_not,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "스크랩",
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
    );
  }
}
