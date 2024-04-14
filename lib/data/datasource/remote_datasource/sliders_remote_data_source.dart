import 'package:abyaty/core/network/dio_helper.dart';
import 'package:abyaty/data/models/sliders/get_all_sliders_entity.dart';
import 'package:dio/dio.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';

abstract class SliderBaseRemoteDataSource {
  Future<GetAllSlidersModel> getSliders();
}

class SliderRemoteDataSource extends SliderBaseRemoteDataSource {
  final DioHelper dioHelper;

  SliderRemoteDataSource({required this.dioHelper});

  @override
  Future<GetAllSlidersModel> getSliders() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.sliders,
      );
      return GetAllSlidersModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        if (e is String) {
          throw ErrorException(
            baseErrorModel: BaseErrorModel(
              message: e.toString(),
            ),
          );
        } else {
          throw ErrorException(
            baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
          );
        }
      } else {
        rethrow;
      }
    }
  }
}
