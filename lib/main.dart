import 'package:cook_app_project/src/provider/Splash_provider.dart';
import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:cook_app_project/src/provider/recipeApi_provider.dart';
import 'package:cook_app_project/src/provider/recipe_provider.dart';
import 'package:cook_app_project/src/view/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cook_app_project/src/provider/bottomNavi_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => SplashProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => DatabaseProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => RecipeListProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => RecipeProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.black),
              ),
            ),
          ),
          home: Splash(),
        ),
      ),
    ),
  );
}
