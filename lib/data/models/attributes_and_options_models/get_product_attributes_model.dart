import 'package:abyaty/data/models/attributes_and_options_models/attributes_model.dart';
import 'package:abyaty/domain/entities/attributes_and_options/get_product_attributees_entity.dart';

class GetProductAttributesModel extends GetProductAttributeEntity {
  const GetProductAttributesModel({
    required super.success,
    required super.code,
    required super.message,
    required super.attributes,
  });

  factory GetProductAttributesModel.fromJson(Map<String, dynamic> json) {
    return GetProductAttributesModel(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      attributes: json['result'].isNotEmpty && json['result'] != null
          ? List<AttributesModel>.from(
              json['result'].map((e) => AttributesModel.fromJson(e)),
            )
          : null,
    );
  }
}
