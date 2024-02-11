class LoginParameters{
  final String email;
  final String password;

  LoginParameters({required this.email, required this.password});


  Map<String, dynamic> toMap(){
    Map<String, dynamic> data = {};
    data["email"] = email;
    data["password"] = password;
    return data;
  }

}
