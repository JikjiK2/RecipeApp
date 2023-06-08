import 'package:flutter/material.dart';

class EmailSearchScreen extends StatefulWidget {
  const EmailSearchScreen({super.key});

  @override
  State<EmailSearchScreen> createState() => _EmailSearchScreenState();
}

class _EmailSearchScreenState extends State<EmailSearchScreen> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                EmailInput("이름"),
                const SizedBox(
                  height: 20.0,
                ),
                EmailInput("휴대 전화 번호 '-' 없이"),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final String Email = EmailController.text;
                      final String phone = phoneController.text;
                    },
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
