import 'package:abyaty/domain/entities/auth_entities/login_entity.dart';
import 'package:abyaty/domain/entities/auth_entities/register_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

/// Login States
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginEntity loginEntity;

  LoginSuccess({required this.loginEntity});
}

class LoginError extends AuthState {
  final String error;

  LoginError({required this.error});
}

/// Register States
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final RegisterEntity registerEntity;

  RegisterSuccess({required this.registerEntity});
}

class RegisterError extends AuthState {
  final String error;

  RegisterError({required this.error});
}
