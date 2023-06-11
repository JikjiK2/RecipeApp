import 'package:flutter/material.dart';

class EmailFailScreen extends StatefulWidget {
  const EmailFailScreen({super.key});

  @override
  State<EmailFailScreen> createState() => _EmailFailScreenState();
}

class _EmailFailScreenState extends State<EmailFailScreen> {
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
            Text("존재하는 이메일이 없습니다."),
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
