import '../../../domain/entities/attributes_and_options/attributes_entity.dart';
import 'options_model.dart';

class AttributesModel extends AttributesEntity {
  const AttributesModel({
    required super.id,
    required super.options,
    required super.name,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) {
    return AttributesModel(
      id: json['attribute_id'],
      options: json['options'].isNotEmpty && json['options'] != null
          ? List<OptionsModel>.from(
              json['options'].map(
                (e) => OptionsModel.fromJson(e),
              ),
            )
          : null,
      name: json['attribute_name'],
    );
  }
}
