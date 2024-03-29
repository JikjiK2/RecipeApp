import 'package:cook_app_project/src/view/EmailSearchScreen.dart';
import 'package:cook_app_project/src/view/PWSearchScreen.dart';
import 'package:cook_app_project/src/view/RegisterScreen.dart';
import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/bottom_navi.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PWController = TextEditingController();
  bool _passwordVisible = true;
  DatabaseProvider? db;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.height;
    final deviceHeight = MediaQuery.of(context).size.width;
    final String Email = EmailController.text;
    final String PW = PWController.text;
    db = Provider.of<DatabaseProvider>(context, listen: false);

    bool isValidEmailFormat(value) {
      return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
    }

    return GestureDetector(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "로그인",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "이메일 주소",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
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
                              hintText: 'Email',
                              suffixIcon: EmailController.text.length > 0
                                  ? IconButton(
                                      icon: Icon(Icons.cancel),
                                      color: Colors.grey,
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onPressed: () {
                                        EmailController.clear();
                                        setState(() {});
                                      },
                                    )
                                  : null),
                          controller: EmailController,
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "비밀번호",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          style: TextStyle(fontFamily: ''),
                          maxLines: 1,
                          keyboardType: TextInputType.visiblePassword,
                          autocorrect: false,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
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
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: _passwordVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              color: Colors.grey,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: (() {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }),
                            ),
                          ),
                          controller: PWController,
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (PW.length > 0 && Email.length > 0)
                          ? () => db!.SignIn(Email, PW).then((value) => {
                                if (value == "null")
                                  {showCustom(context, "빈칸을 입력해주세요.")}
                                else if (value == "login")
                                  {
                                    db!.authState(),
                                    showCustom(context, "로그인에 성공하셨습니다."),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Bottom_Navi()))
                                  }
                                else if (value == "fail")
                                  {
                                    showCustom(
                                        context, "이메일 또는 비밀번호를 다시 확인해주세요.")
                                  }
                                else
                                  showCustom(context, "이메일 또는 비밀번호를 다시 확인해주세요.")
                              })
                          : null,
                      style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      child: Text(
                        "로그인",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            child: TextButton(
                              child: const Text(
                                "이메일 찾기",
                                style: TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EmailSearchScreen()));
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          child: VerticalDivider(
                            thickness: 1.2,
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TextButton(
                              child: const Text(
                                "비밀번호 찾기",
                                style: TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PWSearchScreen()));
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          child: VerticalDivider(
                            thickness: 1.2,
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 20.0),
                            child: TextButton(
                              child: const Text(
                                "회원가입",
                                style: TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//toastmessage
showCustom(BuildContext context, String msg) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Color.fromRGBO(0, 0, 0, 0.57),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            msg,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 3),
    gravity: ToastGravity.BOTTOM,
  );
}
