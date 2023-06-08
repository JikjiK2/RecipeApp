import 'package:cook_app_project/src/model/user.dart';
import "package:flutter/material.dart";

class UserProviderController extends ChangeNotifier {
  late UserModel _user;
  UserProviderController() {
    _user = UserModel();
  }
}
