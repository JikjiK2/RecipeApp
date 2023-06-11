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
  String get nickname => _user.nickname;

  void setName(String name) {
    _user.setname(name);
    notifyListeners();
  }

  void printEmail() {
    print(_user.email);
    notifyListeners();
  }

  void setEmail(String email) {
    _user.setemail(email);
    notifyListeners();
  }

  void setNickname(String nickname) {
    _user.setnickName(nickname);
    notifyListeners();
  }

  void clearEmail() {
    _user.setemail("");
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
    setEmail(email);
    notifyListeners();
    // authPersistence(); // 인증 영속
    return "login";
  }

  Future<String> SignUp(String email, String pw) async {
    if (email == "" || pw == "") {
      return "null";
    }
    try {
      final newUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: pw,
      );
      newUser.user?.updateDisplayName("userName");
      print('회원가입 성공');
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('비밀번호 취약');
        return "password-weak";
      } else if (e.code == 'email-already-in-use') {
        print('이메일 중복');
        return "email-exists";
      }
      return "";
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<String> resetPassword(String email) async {
    if (email == "") {
      return "null";
    }
    try {
      final auth =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "reset";
    } on FirebaseAuthException {
      return "fail";
    }
  }

  Future<String> authState() async {
    var temp = false;
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        temp = true;
      }
    });
    if (temp)
      return "true";
    else
      return "false";
  }

  Future<String> EmailSearch(String name, String phone) async {
    if (name == "" || phone == "") {
      return "null";
    }
    final db = FirebaseFirestore.instance;
    var temp = false;
    try {
      await db
          .collection("users")
          .where("Name", isEqualTo: name)
          .where("PhoneNumber", isEqualTo: phone)
          .get()
          .then((querySnapshot) {
        print(querySnapshot.size);
        if (querySnapshot.size == 0) {
          _user.setemail("");
          print(_user.email);
        } else {
          for (var docSnapshot in querySnapshot.docs) {
            _user.setemail(docSnapshot.get("Email"));
            print(_user.email);
            temp = true;
          }
        }
      });
    } on FirebaseException catch (e) {
      _user.setemail("");
      print(e);
    }
    notifyListeners();
    if (temp) {
      return "true";
    } else {
      return "false";
    }
  }

  Future<String> NickSearch(String email) async {
    final db = FirebaseFirestore.instance;
    var temp = false;
    try {
      await db
          .collection("users")
          .where("Email", isEqualTo: email)
          .get()
          .then((querySnapshot) {
        print(querySnapshot.size);
        if (querySnapshot.size == 0) {
          _user.setnickName("");
        } else {
          for (var docSnapshot in querySnapshot.docs) {
            // print(docSnapshot.get("NickName"));
            _user.setnickName(docSnapshot.get("NickName"));
            temp = true;
          }
        }
      });
    } on FirebaseException catch (e) {
      _user.setnickName("");
      print(e);
    }
    notifyListeners();
    if (temp) {
      return "true";
    } else {
      return "false";
    }
  }

  void SignUpDB(String email, String name, String nickName, String phone) {
    final db = FirebaseFirestore.instance.collection('users');
    db.add({
      "Email": email,
      "Name": name,
      "NickName": nickName,
      "PhoneNumber": phone,
    });
  }
}
