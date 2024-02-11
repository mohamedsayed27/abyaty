import 'package:equatable/equatable.dart';

class BaseResponseEntity extends Equatable {
  final bool? success;
  final int? code;
  final String? message;

  const BaseResponseEntity({
    required this.success,
    required this.code,
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        success,
        code,
        message,
      ];
}
