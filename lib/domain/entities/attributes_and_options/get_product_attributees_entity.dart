import 'package:abyaty/domain/entities/base.dart';

import 'attributes_entity.dart';

class GetProductAttributeEntity extends BaseResponseEntity {
  final List<AttributesEntity>? attributes;

  const GetProductAttributeEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.attributes,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
        attributes,
      ];
}
