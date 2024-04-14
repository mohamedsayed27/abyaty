import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../../domain/entities/sliders/get_all_sliders_entity.dart';
import '../../../domain/repositories/slider_base_repository/slider_base_repository.dart';
import '../../datasource/remote_datasource/sliders_remote_data_source.dart';

class SlidersRepository extends SliderBaseRepository{
  final SliderBaseRemoteDataSource sliderBaseRemoteDataSource;

  SlidersRepository({required this.sliderBaseRemoteDataSource});
  @override
  Future<Either<ErrorException, GetAllSlidersEntity>> getSliders() async {
    try {
      final response =
      await sliderBaseRemoteDataSource.getSliders();
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
