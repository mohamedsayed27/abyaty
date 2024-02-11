import 'package:abyaty/data/datasource/remote_datasource/auth_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/login_parameters.dart';
import '../../../core/parameters/register_parameters.dart';
import '../../../domain/entities/auth_entities/login_entity.dart';
import '../../../domain/entities/auth_entities/register_entity.dart';
import '../../../domain/repositories/auth_base_repository/auth_base_repository.dart';

class AuthRepository extends AuthBaseRepository {
  final AuthBaseRemoteDataSource authBaseRemoteDataSource;

  AuthRepository({required this.authBaseRemoteDataSource});

  @override
  Future<Either<ErrorException, LoginEntity>> login(
    LoginParameters loginParameters,
  ) async {
    try {
      final response = await authBaseRemoteDataSource.login(loginParameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }

  @override
  Future<Either<ErrorException, RegisterEntity>> register(
    RegisterParameters registerParameters,
  ) async {
    try {
      final response = await authBaseRemoteDataSource.register(registerParameters);
      return Right(response);
    } on ErrorException catch (error) {
      return Left(
        ErrorException(
          baseErrorModel: error.baseErrorModel,
        ),
      );
    }
  }
}
