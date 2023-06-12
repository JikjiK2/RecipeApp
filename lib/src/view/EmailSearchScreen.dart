import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/view/EmailFailScreen.dart';
import 'package:cook_app_project/src/view/EmailResultScreen.dart';
import 'package:cook_app_project/src/view/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailSearchScreen extends StatefulWidget {
  const EmailSearchScreen({super.key});

  @override
  State<EmailSearchScreen> createState() => _EmailSearchScreenState();
}

class _EmailSearchScreenState extends State<EmailSearchScreen> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DatabaseProvider? db;
  @override
  Widget build(BuildContext context) {
    final String Email = EmailController.text;
    final String Phone = phoneController.text;
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
                "이메일 찾기",
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
                TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
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
                      hintText: "이름",
                    ),
                    controller: EmailController,
                    onChanged: (text) {
                      setState(() {});
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
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
                      hintText: "휴대 전화 번호  ' - ' 없이",
                    ),
                    controller: phoneController,
                    onChanged: (text) {
                      setState(() {});
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (Email.length > 0 && Phone.length > 0)
                        ? () => {
                              db!.EmailSearch(Email, Phone).then((value) => {
                                    if (value == "null")
                                      {showCustom(context, "빈칸을 입력해주세요.")}
                                    else if (value == "true")
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EmailResultScreen()))
                                      }
                                    else if (value == "false")
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EmailFailScreen()))
                                      }
                                    else
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EmailFailScreen()))
                                      }
                                  })
                            }
                        : null,
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    child: Text(
                      "이메일 찾기",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
