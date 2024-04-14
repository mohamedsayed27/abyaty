import 'package:dartz/dartz.dart';

import '../../../core/error/error_exception.dart';
import '../../entities/sliders/get_all_sliders_entity.dart';

abstract class SliderBaseRepository {

  Future<Either<ErrorException, GetAllSlidersEntity>> getSliders();
}
