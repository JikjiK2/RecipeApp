class UserModel {
  String _name = "abc";
  String _email = "123@naver.com";

  int _abc = 0;

  String get name => _name;
  String get email => _email;
  get abc => _abc;

  String setname(String name) => _name = name;
  String setemail(String email) => _email = email;
  int plus() => _abc++;
  //UserModel({required this.name, required this.email});
}
