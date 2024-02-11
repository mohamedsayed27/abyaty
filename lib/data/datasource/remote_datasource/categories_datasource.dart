import 'package:abyaty/core/network/dio_helper.dart';
import 'package:dio/dio.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';
import '../../models/categories/get_main_categories_model.dart';
import '../../models/categories/get_sub_categories_model.dart';

abstract class CategoriesRemoteBaseDatasource{
  Future<GetMainCategoriesModel> getMainCategories();
  Future<GetSubCategoriesModel> getSubCategories({required int categoryId});
}

class CategoriesRemoteDatasource extends CategoriesRemoteBaseDatasource{
  final DioHelper dioHelper;

  CategoriesRemoteDatasource({required this.dioHelper});
  @override
  Future<GetMainCategoriesModel> getMainCategories() async{
    try {
      final response = await dioHelper.getData(
        url: EndPoints.categories,
      );
      return GetMainCategoriesModel.fromJson(response.data);
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

  @override
  Future<GetSubCategoriesModel> getSubCategories({required int categoryId}) async{
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.subCategories}/$categoryId",
      );
      return GetSubCategoriesModel.fromJson(response.data);
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