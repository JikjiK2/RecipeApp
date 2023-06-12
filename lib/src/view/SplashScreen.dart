import 'package:cook_app_project/src/provider/Splash_provider.dart';
import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseProvider? db;
  @override
  Widget build(BuildContext context) {
    db = Provider.of<DatabaseProvider>(context);
    Future.delayed(const Duration(milliseconds: 3000), () {
      db!.authState();
      db!.UserNick();
    });

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Consumer<SplashProvider>(
        builder: (context, provider, child) => Center(
          child: Lottie.asset(
            "assets/splashIcon.json",
            width: 400,
            height: 400,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
