import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PWSearchScreen extends StatefulWidget {
  const PWSearchScreen({super.key});

  @override
  State<PWSearchScreen> createState() => _PWSearchScreenState();
}

class _PWSearchScreenState extends State<PWSearchScreen> {
  final TextEditingController EmailController = TextEditingController();
  DatabaseProvider? db;

  @override
  Widget build(BuildContext context) {
    db = Provider.of<DatabaseProvider>(context, listen: false);
    final String Email = EmailController.text;

    bool PWSearchCheck() {
      if (RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(Email)) {
        return true;
      } else {
        return false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                splashColor: Colors.transparent,
                splashRadius: 25,
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 8.0,
            ),
            const Text(
              "비밀번호 찾기",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
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
                    hintText: "이메일",
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
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (PWSearchCheck())
                      ? () => {
                            db!.resetPassword(Email).then((value) => {
                                  if (value == "null")
                                    {showCustom(context, "이메일을 입력해주세요.")}
                                  else if (value == "reset")
                                    {
                                      showCustom(
                                          context, "비밀번호 변경을 위한 메일을 보냈습니다."),
                                      Navigator.pop(context)
                                    }
                                  else if (value == "fail")
                                    {
                                      showCustom(
                                          context, "입력하신 이메일을 다시 확인해주세요.")
                                    }
                                  else
                                    showCustom(context, "빈칸을 다시 확인해주세요.")
                                }),
                            db!.resetPassword(Email)
                          }
                      : null,
                  style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white),
                  child: Text(
                    "비밀번호 찾기",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
