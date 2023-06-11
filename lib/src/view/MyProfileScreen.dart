import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/LoginScreen.dart';
import 'package:cook_app_project/src/view/bottom_navi.dart';
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
    db = Provider.of<DatabaseProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(color: Colors.amber),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 90,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Consumer<DatabaseProvider>(
                          builder: (_, user, __) => Text(
                            "${user.nickname} ${user.email} ${user.name}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      db!.signOut();
                      showCustom(context, "로그아웃에 성공하셨습니다.");
                      auth = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Bottom_Navi()));
                    },
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    child: Text(
                      "로그아웃",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
