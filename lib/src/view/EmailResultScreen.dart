import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailResultScreen extends StatefulWidget {
  const EmailResultScreen({super.key});

  @override
  State<EmailResultScreen> createState() => _EmailResultScreenState();
}

class _EmailResultScreenState extends State<EmailResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 8.0,
            ),
            const Text(
              "이메일 찾기",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Consumer<DatabaseProvider>(
              builder: (_, user, __) => Text("이메일은 ${user.email} 입니다."),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "로그인",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
