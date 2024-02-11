import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/parameters/login_parameters.dart';
import '../../entities/auth_entities/login_entity.dart';
import '../../repositories/auth_base_repository/auth_base_repository.dart';

class LoginUseCase extends BaseUseCase<LoginEntity,LoginParameters>{
  final AuthBaseRepository authBaseRepository;

  LoginUseCase({required this.authBaseRepository});
  @override
  Future<Either<ErrorException, LoginEntity>> call(LoginParameters parameters) async{
    return await authBaseRepository.login(parameters);
  }

}