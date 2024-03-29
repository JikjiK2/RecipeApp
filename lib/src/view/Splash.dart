import 'dart:math';
import 'package:cook_app_project/src/provider/Splash_provider.dart';
import 'package:cook_app_project/src/view/SplashScreen.dart';
import 'package:cook_app_project/src/view/bottom_navi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int random = Random().nextInt(20);
bool auth = false;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashProvider>(context);
    print(provider.cookListModel.cookList.length);
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
