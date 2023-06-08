import 'package:cook_app_project/src/provider/database_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cook_app_project/src/provider/bottomNavi_provider.dart';
import 'package:cook_app_project/src/view/bottom_navi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => DatabaseProvider()),
            ChangeNotifierProvider(
                create: (BuildContext context) => BottomNavigationProvider()),
          ],
          child: Bottom_Navi(),
        ),
      ),
    ),
  );
}
