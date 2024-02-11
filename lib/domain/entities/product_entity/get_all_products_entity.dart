import 'package:abyaty/domain/entities/base.dart';
import 'package:equatable/equatable.dart';

import '../paginate_entity.dart';
import 'product_entity.dart';

class GetAllPaginatedProductsEntity extends BaseResponseEntity {
  final ProductPaginatedEntity? productPaginatedEntity;
  const GetAllPaginatedProductsEntity({
    required super.success,
    required super.code,
    required super.message,
    required this.productPaginatedEntity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        super.props,
      ];
}

class ProductPaginatedEntity extends Equatable {
  final List<ProductEntity>? productsList;
  final PaginateFieldsEntity paginateFieldsEntity;

  const ProductPaginatedEntity({
    required this.productsList,
    required this.paginateFieldsEntity,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        productsList,
    paginateFieldsEntity,
      ];
}
