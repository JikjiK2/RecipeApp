class UserModel {
  String _name = "";
  String _email = "";
  String _nickname = "";
  String _phone = "";

  String get name => _name;
  String get email => _email;
  String get nickname => _nickname;
  String get phone => _phone;

  String setname(String name) => _name = name;
  String setemail(String email) => _email = email;
  String setnickName(String nickname) => _nickname = nickname;
  String setphone(String phone) => _phone = phone;
}
