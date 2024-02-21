import 'package:abyaty/domain/entities/base.dart';

import 'slider_details_entity.dart';

class GetAllSlidersEntity extends BaseResponseEntity {
  final List<SliderDetailsEntity>? sliderDetailsEntity;

  const GetAllSlidersEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.sliderDetailsEntity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
        sliderDetailsEntity,
      ];
}
