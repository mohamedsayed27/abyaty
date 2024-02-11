import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/parameters/login_parameters.dart';
import '../../../core/parameters/register_parameters.dart';
import '../../entities/auth_entities/login_entity.dart';
import '../../entities/auth_entities/register_entity.dart';
import '../../repositories/auth_base_repository/auth_base_repository.dart';

class RegisterUseCase extends BaseUseCase<RegisterEntity,RegisterParameters>{
  final AuthBaseRepository authBaseRepository;

  RegisterUseCase({required this.authBaseRepository});
  @override
  Future<Either<ErrorException, RegisterEntity>> call(RegisterParameters parameters) async{
    return await authBaseRepository.register(parameters);
  }

}