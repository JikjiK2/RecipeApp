import 'package:flutter/material.dart';

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Container(
                color: Colors.blue,
                height: 110,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.amber,
                height: 110,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.lightBlueAccent,
                height: 110,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                color: Colors.amberAccent,
                height: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
