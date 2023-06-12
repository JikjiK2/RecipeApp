import 'package:cook_app_project/src/provider/database_provider.dart';
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
  bool Nickcheck = false;
  bool click = false;

  @override
  Widget build(BuildContext context) {
    db = Provider.of<DatabaseProvider>(context, listen: false);
    final String Email = EmailController.text;
    final String PW = PWController.text;
    final String PWCK = PWCKController.text;
    final String name = NameController.text;
    final String nickName = NickNameController.text;
    final String phone = PhoneController.text;

    bool SignCheck() {
      if (PWCK == PW &&
          name.length > 0 &&
          phone.length > 0 &&
          click &&
          Nickcheck &&
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$')
              .hasMatch(PW) &&
          RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(Email)) {
        return true;
      } else {
        return false;
      }
    }

    FocusNode btnFocus = FocusNode();
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
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "이메일 주소",
                            ),
                            const SizedBox(
                              width: 10.0,
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
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    color: Email.length == 0 ||
                                            RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                .hasMatch(Email)
                                        ? Colors.black
                                        : Colors.red,
                                    width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: Email.length == 0 ||
                                              RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                  .hasMatch(Email)
                                          ? Color.fromRGBO(125, 125, 125, 0.4)
                                          : Colors.red,
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
                        Email.length > 0
                            ? !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(Email)
                                ? Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(children: [
                                      Text(
                                        "이메일 형식에 맞지 않습니다.",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ]))
                                : SizedBox()
                            : SizedBox(),
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
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          style: TextStyle(fontFamily: ''),
                          maxLines: 1,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Colors.black,
                          autocorrect: false,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: PW.length == 0 ||
                                          RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$')
                                              .hasMatch(PW)
                                      ? Colors.black
                                      : Colors.red,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    color: PW.length == 0 ||
                                            RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$')
                                                .hasMatch(PW)
                                        ? Color.fromRGBO(125, 125, 125, 0.4)
                                        : Colors.red,
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
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                        PW.length > 0
                            ? !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$')
                                    .hasMatch(PW)
                                ? Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(children: [
                                      Text(
                                        "영문 대소문자, 숫자, 특수문자, 최소 1개 이상 포함\n비밀번호 8 - 25자리\n특수문자 @ \$ ! % * ? & ",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ]))
                                : SizedBox()
                            : SizedBox(),
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
                          cursorColor: Colors.black,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: (PWCK.length == 0) ||
                                          (PWCK == PW && PWCK.length > 7)
                                      ? Colors.black
                                      : Colors.red,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    color: (PWCK.length == 0) ||
                                            (PWCK == PW && PWCK.length > 7)
                                        ? Color.fromRGBO(125, 125, 125, 0.4)
                                        : Colors.red,
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
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                        (PWCK.length == 0) || (PWCK == PW && PWCK.length > 7)
                            ? SizedBox()
                            : Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(children: [
                                  Text(
                                    "비밀번호가 일치하지 않습니다.",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ])),
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
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          maxLines: 1,
                          autocorrect: false,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            hintText: "이름",
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
                          ),
                          controller: NameController,
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
                              "휴대 전화 번호",
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          maxLines: 1,
                          autocorrect: false,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            hintText: "' - ' 없이",
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
                          ),
                          controller: PhoneController,
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
                              "닉네임",
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: 1,
                                autocorrect: false,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 15),
                                  hintText: "닉네임",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: nickName.length != 0 && click
                                            ? !Nickcheck
                                                ? Colors.red
                                                : Color.fromRGBO(
                                                    125, 125, 125, 0.4)
                                            : Color.fromRGBO(
                                                125, 125, 125, 0.4),
                                        width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                          color: nickName.length != 0 && click
                                              ? !Nickcheck
                                                  ? Colors.red
                                                  : Color.fromRGBO(
                                                      125, 125, 125, 0.4)
                                              : Color.fromRGBO(
                                                  125, 125, 125, 0.4),
                                          width: 2.0)),
                                ),
                                controller: NickNameController,
                                onChanged: (text) {
                                  click = false;
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              height: 60,
                              child: ElevatedButton(
                                onPressed: (nickName.length > 1)
                                    ? () => db!
                                        .NickSearch(nickName)
                                        .then((value) => {
                                              if (value == "true")
                                                Nickcheck = true
                                              else
                                                Nickcheck = false,
                                              setState(() {}),
                                              click = true,
                                            })
                                    : null,
                                style: ElevatedButton.styleFrom(
                                    splashFactory: NoSplash.splashFactory,
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white),
                                child: Text(
                                  "중복확인",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                        nickName.length != 0 && click
                            ? !Nickcheck
                                ? Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(children: [
                                      Text(
                                        "사용 중인 닉네임입니다.",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ]))
                                : Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(children: [
                                      Text(
                                        "사용 가능한 닉네임입니다.",
                                        style: TextStyle(color: Colors.blue),
                                      )
                                    ]))
                            : SizedBox(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            focusNode: btnFocus,
                            onPressed: (SignCheck())
                                ? () => db!.SignUp(Email, PW).then((value) => {
                                      if (value == "null")
                                        {showCustom(context, "빈칸을 입력해주세요.")}
                                      else if (value == "success")
                                        {
                                          showCustom(context, "회원가입에 성공하셨습니다."),
                                          db!.SignUpDB(
                                              Email, name, nickName, phone),
                                          btnFocus.unfocus(),
                                          Navigator.pop(context)
                                        }
                                      else if (value == "password-weak")
                                        {
                                          showCustom(
                                              context, "비밀번호가 8자리 이상 입력해주세요.")
                                        }
                                      else if (value == "email-exists")
                                        {
                                          showCustom(
                                              context, "현재 사용 중인 이메일입니다.")
                                        }
                                      else
                                        showCustom(context, "빈칸을 다시 확인해주세요.")
                                    })
                                : null,
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
                ],
              ),
            ),
          ),
        ),
      ),
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
