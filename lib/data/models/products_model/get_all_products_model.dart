import 'package:abyaty/data/models/paginated_model.dart';
import 'package:abyaty/data/models/products_model/product_model.dart';
import 'package:abyaty/domain/entities/product_entity/get_all_products_entity.dart';

class GetAllProductsModel extends GetAllPaginatedProductsEntity {
  const GetAllProductsModel({
    required super.success,
    required super.code,
    required super.message,
    required super.productPaginatedEntity,
  });

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) {
    return GetAllProductsModel(
      success: json["success"],
      code: json["code"],
      message: json["message"],
      productPaginatedEntity: json["result"]!=null?ProductPaginatedModel.fromJson(
        json["result"],
      ):null,
    );
  }
}

class ProductPaginatedModel extends ProductPaginatedEntity {
  const ProductPaginatedModel({
    required super.productsList,
    required super.paginateFieldsEntity,
  });

  factory ProductPaginatedModel.fromJson(Map<String, dynamic> json) {
    return ProductPaginatedModel(
      paginateFieldsEntity: PaginationFieldsModel.fromJson(
        json["pagination"],
      ),
      productsList: json["data"] != null && json["data"].isNotEmpty
          ? List<ProductModel>.from(
              json["data"].map((e) => ProductModel.fromJson(e)),
            )
          : null,
    );
  }
}
