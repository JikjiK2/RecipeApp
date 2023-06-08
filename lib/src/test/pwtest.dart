import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class AppHome extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  @override
  Widget build(BuildContext context) {
    return new Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.5),
        child: Column(
          children: [
            new SizedBox(
              height: 50,
            ),
            TextField(
                controller: controller,
                decoration: new InputDecoration(
                    hintText: "Password",
                    border: new OutlineInputBorder(borderSide: BorderSide()))),
            new SizedBox(
              height: 5,
            ),
            new FlutterPwValidator(
              key: validatorKey,
              controller: controller,
              minLength: 8,
              uppercaseCharCount: 1,
              lowercaseCharCount: 1,
              numericCharCount: 8,
              specialCharCount: 1,
              width: 400,
              height: 200,
              onSuccess: () {
                print("MATCHED");
                ScaffoldMessenger.of(context).showSnackBar(
                    new SnackBar(content: new Text("Password is matched")));
              },
              onFail: () {
                print("NOT MATCHED");
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
