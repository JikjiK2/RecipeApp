import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PWController = TextEditingController();
  final TextEditingController PWCKController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController PhoneController = TextEditingController();
  final TextEditingController NickNameController = TextEditingController();

  bool _passwordVisible = true;

  DatabaseProvider? db;

  bool PWcheck = false;

  @override
  Widget build(BuildContext context) {
    db = Provider.of<DatabaseProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        padding: EdgeInsets.only(right: 30.0),
                        icon: Icon(Icons.keyboard_backspace),
                        splashRadius: 20,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        "회원가입",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "이메일 주소",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "*필수",
                        style: TextStyle(color: Colors.red, fontSize: 10),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                        hintText: '이메일 주소',
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
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "비밀번호",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "*필수",
                        style: TextStyle(color: Colors.red, fontSize: 10),
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(125, 125, 125, 0.4),
                              width: 2.0)),
                      hintText: '비밀번호 6자리 이상',
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
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "비밀번호 확인",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "*필수",
                        style: TextStyle(color: Colors.red, fontSize: 10),
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(125, 125, 125, 0.4),
                              width: 2.0)),
                      hintText: '비밀번호 확인',
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
                    controller: PWCKController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "이름",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "*필수",
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: NameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "이름",
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "휴대 전화 번호",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "*필수",
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: PhoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "휴대 전화 번호",
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "닉네임",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "*필수",
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: NickNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "닉네임",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        height: 60,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(0, 0, 0, 0.5))),
                          child: const Text(
                            "중복확인",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final String Email = EmailController.text;
                        final String PW = PWController.text;
                        final String name = NameController.text;
                        final String nickName = NickNameController.text;
                        final String phone = PhoneController.text;

                        final signUp = db!.SignUp(Email, PW).then((value) => {
                              if (value == "null")
                                {showCustom(context, "빈칸을 입력해주세요.")}
                              else if (value == "success")
                                {
                                  showCustom(context, "회원가입에 성공하셨습니다."),
                                  db!.SignUpDB(Email, name, nickName, phone),
                                  Navigator.pop(context)
                                }
                              else if (value == "password-weak")
                                {showCustom(context, "비밀번호가 6자리 이상 입력해주세요.")}
                              else if (value == "email-exists")
                                {showCustom(context, "중복 사용 중인 이메일입니다.")}
                              else
                                showCustom(context, "빈칸을 다시 확인해주세요.")
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      child: Text(
                        "회원가입",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget EmailInput() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                  color: Color.fromRGBO(125, 125, 125, 0.4), width: 2.0)),
          hintText: 'email',
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
    );
  }

  Widget PasswordInput() {
    return TextFormField(
      style: TextStyle(fontFamily: ''),
      maxLines: 1,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
                color: Color.fromRGBO(125, 125, 125, 0.4), width: 2.0)),
        hintText: 'password',
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
    );
  }
}

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
    toastDuration: const Duration(seconds: 2),
    gravity: ToastGravity.BOTTOM,
  );
}
