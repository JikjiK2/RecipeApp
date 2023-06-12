import 'package:cook_app_project/src/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late UserModel _user;

  void update() {
    notifyListeners();
  }

  void Singin() {
    _user;
    notifyListeners();
  }
}
