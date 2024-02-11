import 'package:abyaty/domain/entities/base.dart';

class RegisterEntity extends BaseResponseEntity{
  const RegisterEntity({required super.success, required super.code, required super.message,});
  @override
  // TODO: implement props
  List<Object?> get props => [
    success,
    code,
    message,
  ];
}