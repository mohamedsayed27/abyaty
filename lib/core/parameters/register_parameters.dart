class RegisterParameters {
  final String email;
  final String password;
  final String name;

  RegisterParameters({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data["email"] = email;
    data["password"] = password;
    data["first_name"] = name;
    return data;
  }
}
