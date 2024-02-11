import 'package:abyaty/domain/entities/base.dart';
import 'package:abyaty/domain/entities/product_entity/product_entity.dart';


class GetNotPaginatedProductEntity extends BaseResponseEntity {
  final List<ProductEntity>? productsList;

  const GetNotPaginatedProductEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.productsList,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [super.props,productsList,];
}
