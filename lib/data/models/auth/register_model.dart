import 'package:abyaty/domain/entities/auth_entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.success,
    required super.code,
    required super.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
    );
  }
}
