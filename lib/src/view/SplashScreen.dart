import 'package:cook_app_project/src/provider/Splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
