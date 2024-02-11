import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/parameters/login_parameters.dart';
import '../../../core/parameters/register_parameters.dart';
import '../../entities/auth_entities/login_entity.dart';
import '../../entities/auth_entities/register_entity.dart';

abstract class AuthBaseRepository{
  Future<Either<ErrorException,LoginEntity>> login(LoginParameters loginParameters);
  Future<Either<ErrorException,RegisterEntity>> register(RegisterParameters registerParameters);
}