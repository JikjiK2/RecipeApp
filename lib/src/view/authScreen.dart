import 'package:cook_app_project/src/provider/Splash_provider.dart';
import 'package:cook_app_project/src/view/SplashScreen.dart';
import 'package:cook_app_project/src/view/bottom_navi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class authScreen extends StatelessWidget {
  const authScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, provider, child) {
        if (provider.isSplash) {
          return SplashScreen();
        } else {
          return Bottom_Navi();
        }
      },
    );
  }
}
