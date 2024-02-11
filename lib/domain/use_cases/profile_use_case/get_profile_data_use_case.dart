
import 'package:abyaty/core/error/error_exception.dart';
import 'package:abyaty/domain/entities/profile/user_profile_details_entity.dart';
import 'package:abyaty/domain/repositories/profile_base_repository/profile_base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';

class GetProfileDataUseCase extends BaseUseCase<ProfileDetailsEntity,NoParameters>{
  final ProfileBaseRepository profileBaseRepository;

  GetProfileDataUseCase({required this.profileBaseRepository});
  @override
  Future<Either<ErrorException, ProfileDetailsEntity>> call(NoParameters parameters) async{
    return await profileBaseRepository.getProfileData();
  }

}