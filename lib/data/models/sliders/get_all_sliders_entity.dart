import 'package:abyaty/domain/entities/sliders/get_all_sliders_entity.dart';
import 'package:abyaty/domain/entities/sliders/slider_details_entity.dart';

class GetAllSlidersModel extends GetAllSlidersEntity {
  const GetAllSlidersModel({
    required super.success,
    required super.code,
    required super.message,
    required super.sliderDetailsEntity,
  });

  factory GetAllSlidersModel.fromJson(Map<String, dynamic> json) {
    return GetAllSlidersModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      sliderDetailsEntity: List<SliderDetailsModel>.from(
        json["result"].map(
          (e) => SliderDetailsModel.fromJson(e),
        ),
      ),
    );
  }
}

class SliderDetailsModel extends SliderDetailsEntity {
  const SliderDetailsModel({
    required super.id,
    required super.title,
    required super.details,
    required super.photo,
  });

  factory SliderDetailsModel.fromJson(Map<String, dynamic> json) {
    return SliderDetailsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      details: json['details'] as String?,
      photo: json['photo'] as String?,
    );
  }

}
