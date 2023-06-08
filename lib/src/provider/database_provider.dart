import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_app_project/src/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  late UserModel _user;

  DatabaseProvider() {
    _user = UserModel();
  }

  String get name => _user.name;
  String get email => _user.email;
  get abc => _user.abc;

  void setName(String name) {
    _user.setname(name);
    notifyListeners();
  }

  void setEmail(String email) {
    _user.setemail(email);
    notifyListeners();
  }

  void Plus() {
    _user.plus();
    notifyListeners();
  }

  Future<String> SignIn(String email, String pw) async {
    if (email == "" || pw == "") {
      return "null";
    }
    try {
      final auth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pw);
    } on FirebaseAuthException {
      return "fail";
    }
    print('login');
    // authPersistence(); // 인증 영속
    return "login";
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void Login(String id, String pw) {
    final _db = FirebaseFirestore.instance.collection('users').doc().get();

    print(_db);
    final db = FirebaseFirestore.instance.collection('users');
    db.where("ID", isEqualTo: id).where("Password", isEqualTo: pw).get().then(
      (querySnapshot) {
        print(id + ":" + pw);
        if (querySnapshot.docs.length == 1) {
          //print(querySnapshot);
          print("로그인 성공!!!");
        } else {
          print("로그인 실패...");
        }
      },
    );
    //_user = UserModel(ID: id,name: id,);
    //notifyListeners();
  }

  void logout() {
    // 로그아웃 처리 로직을 구현합니다.
    // 사용자 정보를 초기화하고 notifyListeners()를 호출하여 UI에 변경 사항을 알립니다.
    //_user = null;
    notifyListeners();
  }

  bool IDcheck(String id) {
    final db = FirebaseFirestore.instance.collection('users');
    bool temp = true;
    db.where("ID", isEqualTo: id).get().then(
      (querySnapshot) {
        if (querySnapshot.docs.length == 1) {
          temp = false;
          print(temp);
        } else {
          temp = true;
          print(temp);
        }
        print(querySnapshot.docs.length);
      },
    );
    print(temp);
    return temp;
  }

  bool? Nickcheck(String nickName) {
    final db = FirebaseFirestore.instance.collection('users');
    db.where("NickName", isEqualTo: nickName).get().then(
      (querySnapshot) {
        if (querySnapshot.docs.length == 1) {
          print("아이디 중복...");
          return false;
        } else {
          print("아이디 사용가능!!!");
          return true;
        }
      },
    );
    return null;
  }

  void SignUp(
      String id, String pw, String name, String nickName, String email) {
    final db = FirebaseFirestore.instance.collection('users');
    bool IDcheck = false;
    bool Nickcheck = false;
    if (IDcheck == true && Nickcheck == true) {
      db.add({
        "ID": id,
        "Password": pw,
        "Name": name,
        "NickName": nickName,
        "Email": email
      });
    }
    //_user = UserModel();
    notifyListeners();
  }
}
