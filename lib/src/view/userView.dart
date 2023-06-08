import 'package:cook_app_project/src/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class userView extends StatefulWidget {
  const userView({super.key});

  @override
  State<userView> createState() => _userViewState();
}

class _userViewState extends State<userView> {
  UserProviderController? controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<UserProviderController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM Provider test'),
      ),
    );
  }
}
