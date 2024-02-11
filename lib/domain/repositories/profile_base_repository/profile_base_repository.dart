import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../entities/profile/user_profile_details_entity.dart';

abstract class ProfileBaseRepository{
  Future<Either<ErrorException,ProfileDetailsEntity>> getProfileData();
}