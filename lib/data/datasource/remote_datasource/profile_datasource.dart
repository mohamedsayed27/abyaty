import 'package:dio/dio.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/error_message_model.dart';
import '../../models/profile/profile_details_model.dart';

abstract class ProfileBaseRemoteDataSource{
  Future<ProfileDetailsModel> getUserProfileDetails();
}

 class ProfileRemoteDataSource extends ProfileBaseRemoteDataSource{
   final DioHelper dioHelper;

  ProfileRemoteDataSource({required this.dioHelper});
  @override
  Future<ProfileDetailsModel> getUserProfileDetails() async{
    try {
      final response = await dioHelper.getData(
        url: EndPoints.categories,
      );
      return ProfileDetailsModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }
}