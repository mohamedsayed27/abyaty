import 'package:abyaty/core/parameters/add_to_cart_parameters.dart';
import 'package:abyaty/data/models/cart_entity/get_cart_model.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/constants.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/parameters/filtered_products_parameters.dart';
import '../../../core/parameters/product_review_parameters.dart';
import '../../models/attributes_and_options_models/get_product_attributes_model.dart';
import '../../models/base_model.dart';
import '../../models/products_model/get_all_products_model.dart';
import '../../models/products_model/get_product_details_model.dart';
import '../../models/products_model/get_top_selling_products_model.dart';

abstract class ProductBaseRemoteDataSource {
  Future<GetProductAttributesModel> getProductAttributes({
    required int id,
  });

  Future<GetAllProductsModel> getAllProducts({
    ProductParameters? parameters,
  });

  Future<GetProductDetailsModel> getProductDetails({
    int? parameters,
  });

  Future<GetNotPaginatedProductsModel> getTopSellingProducts();

  Future<GetCartListModel> getCartList();

  Future<GetNotPaginatedProductsModel> getWishedProducts();

  Future<BaseResponseModel> addProductToFavorite({
    required String id,
  });

  Future<BaseResponseModel> removeProductFromFavorite({
    required String id,
  });

  Future<BaseResponseModel> addProductToCart({
    required AddToCartParameters parameters,
  });

  Future<BaseResponseModel> removeProductFromCart({
    required String id,
  });

  Future<BaseResponseModel> reviewProduct({
    required ProductReviewsParameters parameters,
  });
}

class ProductRemoteDataSource extends ProductBaseRemoteDataSource {
  final DioHelper dioHelper;

  ProductRemoteDataSource({required this.dioHelper});

  @override
  Future<BaseResponseModel> addProductToFavorite({
    required String id,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: "${EndPoints.addToFavorite}/$id",
      );
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<GetAllProductsModel> getAllProducts({
    ProductParameters? parameters,
  }) async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.allProductsList,
        query: parameters?.toJson(),
      );
      return GetAllProductsModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<GetProductAttributesModel> getProductAttributes({
    required int id,
  }) async {
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.attributes}/$id",
      );
      return GetProductAttributesModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<GetProductDetailsModel> getProductDetails({
    int? parameters,
  }) async {
    try {
      final response = await dioHelper.getData(
        url: "${EndPoints.productDetails}/$parameters",
      );
      return GetProductDetailsModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<GetNotPaginatedProductsModel> getTopSellingProducts() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.topSellingProducts,
      );
      print(response);
      return GetNotPaginatedProductsModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print(e);
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<GetNotPaginatedProductsModel> getWishedProducts() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.getFavoritesList,
      );
      return GetNotPaginatedProductsModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<BaseResponseModel> removeProductFromFavorite({
    required String id,
  }) async {
    try {
      final response = await dioHelper.deleteData(
        url: "${EndPoints.removeFromFavorite}/$id",
      );
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<BaseResponseModel> reviewProduct({
    required ProductReviewsParameters parameters,
  }) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.address,
        data: parameters.toJson(),
      );
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<BaseResponseModel> addProductToCart({required AddToCartParameters parameters}) async {
    try {
      final response = await dioHelper.postData(
        url: EndPoints.addToCart,
        data: parameters.toJson(),
      );
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<BaseResponseModel> removeProductFromCart({required String id}) async {
    try {
      final response = await dioHelper.deleteData(
        url: "${EndPoints.removeFromCart}/$id",
      );
      return BaseResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<GetCartListModel> getCartList() async {
    try {
      final response = await dioHelper.getData(
        url: EndPoints.getCartList,
      );
      return GetCartListModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ErrorException(
          baseErrorModel: BaseErrorModel.fromJson(e.response!.data),
        );
      } else {
        rethrow;
      }
    }
  }
}
