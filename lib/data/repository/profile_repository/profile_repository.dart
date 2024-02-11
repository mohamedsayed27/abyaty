import 'package:abyaty/data/datasource/remote_datasource/profile_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../domain/entities/profile/user_profile_details_entity.dart';
import '../../../domain/repositories/profile_base_repository/profile_base_repository.dart';

class ProfileRepository extends ProfileBaseRepository {
  final ProfileBaseRemoteDataSource profileBaseRemoteDataSource;

  ProfileRepository({required this.profileBaseRemoteDataSource});
  @override
  Future<Either<ErrorException, ProfileDetailsEntity>> getProfileData() async{
    try {
      final response = await profileBaseRemoteDataSource.getUserProfileDetails();
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
