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
                EmailInput("이메일"),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final String Email = EmailController.text;
                      final resetPW = db!.resetPassword(Email).then((value) => {
                            if (value == "null")
                              {showCustom(context, "이메일을 입력해주세요.")}
                            else if (value == "reset")
                              {
                                showCustom(context, "입력하신 이메일 주소의 메일을 확인해주세요."),
                                Navigator.pop(context)
                              }
                            else if (value == "fail")
                              {showCustom(context, "입력하신 이메일을 다시 확인해주세요.")}
                            else
                              showCustom(context, "빈칸을 다시 확인해주세요.")
                          });
                      db!.resetPassword(Email);
                    },
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
        ));
  }

  Widget EmailInput(String msg) {
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
          hintText: msg,
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
}
