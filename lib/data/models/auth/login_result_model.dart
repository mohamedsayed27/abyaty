import '../../../domain/entities/auth_entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    super.success,
    super.code,
    super.message,
    super.result,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      result: LoginResultModel.fromJson(
        json['result'],
      ),
    );
  }
}

class LoginResultModel extends LoginResultResult {
  const LoginResultModel({
    super.authToken,
    super.tokenType,
    super.firstLogin,
  });

  factory LoginResultModel.fromJson(Map<String, dynamic> json) {
    return LoginResultModel(
      authToken: json["authToken"],
      tokenType: json["tokenType"],
      firstLogin: json["first_login"],
    );
  }
}
