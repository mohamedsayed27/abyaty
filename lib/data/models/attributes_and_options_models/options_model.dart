import 'package:abyaty/domain/entities/attributes_and_options/options_entity.dart';

class OptionsModel extends OptionEntity {
  const OptionsModel({
    required super.id,
    required super.name,
  });

  factory OptionsModel.fromJson(Map<String, dynamic> json) {
    return OptionsModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
