import 'package:equatable/equatable.dart';

class BaseErrorModel extends Equatable {
  final String? message;
  final bool? success;
  final int? code;

  const BaseErrorModel({
     this.message,
     this.success,
     this.code,
  });

  factory BaseErrorModel.fromJson(Map<String, dynamic> json) {
    return BaseErrorModel(
      message: json['message'],
      success: json['success'],
      code: json['code'],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     "message": message,
  //     "status": status,
  //     "data": data,
  //   };
  // }

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
        success,
        code,
      ];
}
