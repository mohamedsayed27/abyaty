import '../../../core/error/error_exception.dart';
import '../../../domain/entities/sliders/get_all_sliders_entity.dart';
import '../../../domain/repositories/slider_base_repository/slider_base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_use_case/base_use_case.dart';

class GetSlidersDataUseCase
    extends BaseUseCase<GetAllSlidersEntity, NoParameters> {
  final SliderBaseRepository sliderBaseRepository;

  GetSlidersDataUseCase({required this.sliderBaseRepository});

  @override
  Future<Either<ErrorException, GetAllSlidersEntity>> call(
      NoParameters parameters) async {
    return await sliderBaseRepository.getSliders();
  }
}
