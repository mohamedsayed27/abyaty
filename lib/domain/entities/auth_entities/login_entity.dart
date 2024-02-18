import 'package:abyaty/domain/entities/base.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends BaseResponseEntity {
  final LoginResultResult? result;

  const LoginEntity({
    super.success,
    super.code,
    super.message,
    this.result,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
        result,
      ];
}

class LoginResultResult extends Equatable {
  final String? authToken;
  final String? tokenType;
  final String? firstLogin;

  const LoginResultResult({
    this.authToken,
    this.tokenType,
    this.firstLogin,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        authToken,
        tokenType,
        firstLogin,
      ];
}
