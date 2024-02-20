import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/parameters/add_to_cart_parameters.dart';
import '../../../core/parameters/filtered_products_parameters.dart';
import '../../../core/parameters/product_review_parameters.dart';
import '../../../core/services/services_locator.dart';
import '../../../domain/entities/attributes_and_options/attributes_entity.dart';
import '../../../domain/entities/categories/categories_details_entity.dart';
import '../../../domain/entities/categories/sub_category_details_entity.dart';
import '../../../domain/entities/product_entity/product_details_details_entity.dart';
import '../../../domain/entities/product_entity/product_entity.dart';
import '../../../domain/use_cases/categories_use_case/get_categories_list_use_case.dart';
import '../../../domain/use_cases/categories_use_case/sub_category_use_case.dart';
import '../../../domain/use_cases/products_use_case/add_product_to_cart_use_case.dart';
import '../../../domain/use_cases/products_use_case/add_product_to_favorite_use_case.dart';
import '../../../domain/use_cases/products_use_case/get_all_products_use_case.dart';
import '../../../domain/use_cases/products_use_case/get_cart_list_use_case.dart';
import '../../../domain/use_cases/products_use_case/get_favorite_products_use_case.dart';
import '../../../domain/use_cases/products_use_case/get_product_attributes_use_case.dart';
import '../../../domain/use_cases/products_use_case/get_product_details_use_case.dart';
import '../../../domain/use_cases/products_use_case/get_top_selling_use_case.dart';
import '../../../domain/use_cases/products_use_case/remove_product_from_cart_use_case.dart';
import '../../../domain/use_cases/products_use_case/remove_product_from_favorite_use_case.dart';
import '../../../domain/use_cases/products_use_case/review_product_use_case.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  final AddProductToCartUseCase _addProductToCartUseCase = sl();
  final AddProductToFavoriteUseCase _addProductToFavoriteUseCase = sl();
  final GetAllProductUseCase _getAllProductUseCase = sl();
  final GetCartListUseCase _getCartListUseCase = sl();
  final GetFavoriteProductsUseCase _getFavoriteProductsUseCase = sl();
  final GetProductAttributesUseCase _getProductAttributesUseCase = sl();
  final GetProductDetailsUseCase _getProductDetailsUseCase = sl();
  final GetTopSellingProductUseCase _getTopSellingProductUseCase = sl();
  final RemoveProductFromFavoriteUseCase _removeProductFromFavoriteUseCase = sl();
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase = sl();
  final ReviewProductUseCase _reviewProductUseCase = sl();
  final GetCategoriesListUseCase _getCategoriesListUseCase = sl();
  final GetSubCategoriesListUseCase _getSubCategoriesListUseCase = sl();

  List<ProductEntity> allProducts = [];

  void addProductToCart({
    required AddToCartParameters addToCartParameters,
  }) async {
    emit(AddToCartLoading());
    final response = await _addProductToCartUseCase(addToCartParameters);
    response.fold((l) {
      emit(AddToCartError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      emit(AddToCartSuccess());
    });
  }

  void addProductReview({
    required ProductReviewsParameters productReviewsParameters,
  }) async {
    emit(AddToCartLoading());
    final response = await _reviewProductUseCase(productReviewsParameters);
    response.fold((l) {
      emit(AddToCartError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      emit(AddToCartSuccess());
    });
  }

  void addProductToFavorite({
    required int id,
  }) async {
    emit(AddToFavoriteLoading());
    final response = await _addProductToFavoriteUseCase(id);
    response.fold((l) {
      emit(AddToFavoriteError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      emit(AddToFavoriteSuccess());
    });
  }

  void removeProductFromFavorite({
    required int id,
  }) async {
    emit(RemoveFromFavoriteLoading());
    final response = await _removeProductFromFavoriteUseCase(id);
    response.fold((l) {
      emit(RemoveFromFavoriteError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      emit(RemoveFromFavoriteSuccess());
    });
  }

  void removeProductFromCart({
    required int id,
  }) async {
    emit(RemoveFromCartLoading());
    final response = await _removeProductFromCartUseCase(id);
    response.fold((l) {
      emit(RemoveFromCartError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      emit(RemoveFromCartSuccess());
    });
  }

  void getAllProduct({
    ProductParameters? parameters,
  }) async {
    emit(GetAllProductLoading());
    final response = await _getAllProductUseCase(parameters);
    response.fold((l) {
      emit(GetAllProductError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      emit(GetAllProductSuccess());
    });
  }

  List<ProductEntity> productsByCategory = [];
  int productByCategoryPageNumber = 1;

  void getAllProductByCategoryId({
    required int categoryId,
    int? subCategoryId,
  }) async {
    emit(GetAllProductLoading());
    final response = await _getAllProductUseCase(
      ProductParameters(
        categoryId: categoryId,
        subcategoryId: subCategoryId,
        page: productByCategoryPageNumber,
      ),
    );
    response.fold((l) {

      emit(GetAllProductError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      if(r.productPaginatedEntity!=null){
        if (productByCategoryPageNumber <=
            r.productPaginatedEntity!.paginateFieldsEntity.currentPage) {
          if (r.productPaginatedEntity!.productsList != null &&
              r.productPaginatedEntity!.productsList!.isNotEmpty) {
            for (var element in r.productPaginatedEntity!.productsList!) {
              productsByCategory.add(element);
            }
            productByCategoryPageNumber++;
          }
        }
      }

      emit(GetAllProductSuccess());
    });
  }

  void getCartList() async {
    emit(GetCartListLoading());
    final response = await _getCartListUseCase(const NoParameters());
    response.fold((l) {
      emit(GetCartListError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      emit(GetCartListSuccess());
    });
  }

  List<ProductEntity>? favoritesProducts = [];
  void getFavoritesList() async {
    emit(GetFavoriteListLoading());
    final response = await _getFavoriteProductsUseCase(const NoParameters());
    response.fold((l) {
      emit(GetFavoriteListError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      if (r.productsList != null && r.productsList!.isNotEmpty) {
        favoritesProducts = r.productsList!;
      }
      emit(GetFavoriteListSuccess());
    });
  }

  List<AttributesEntity>? productAttributesList = [];
  void getProductAttributes({required int productId}) async {
    emit(GetProductsAttributeLoading());
    final response = await _getProductAttributesUseCase(productId);
    response.fold((l) {
      emit(GetProductsAttributeError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      if (r.attributes != null && r.attributes!.isNotEmpty) {
        productAttributesList = r.attributes;
      }
      emit(GetProductsAttributeSuccess());
    });
  }

  ProductDetailsEntity? productDetailsEntity;
  void getProductDetails({required int productId}) async {
    emit(GetProductDetailsLoading());
    final response = await _getProductDetailsUseCase(productId);
    response.fold((l) {
      emit(GetProductDetailsError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      productDetailsEntity = r.productDetailsEntity;
      emit(GetProductDetailsSuccess());
    });
  }

  List<ProductEntity>? topSellingProducts = [];

  void getTopSelling() async {
    emit(GetTopSellingProductsLoading());
    final response = await _getTopSellingProductUseCase(const NoParameters());
    response.fold((l) {
      emit(GetTopSellingProductsError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      if (r.productsList != null && r.productsList!.isNotEmpty) {
        topSellingProducts = r.productsList;
      }
      emit(GetTopSellingProductsSuccess());
    });
  }

  List<CategoryDetailsEntity>? categories = [];
  void getCategories() async {
    categories = [];
    emit(GetCategoriesLoading());
    final response = await _getCategoriesListUseCase(const NoParameters());
    response.fold((l) {
      print(l);
      emit(GetCategoriesError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
      print(r.categoryDetailsEntity,);
        categories = r.categoryDetailsEntity;
      emit(GetCategoriesSuccess());
    });
  }

  List<SubCategoryDetailsEntity>? subCategories = [];
  void getSubCategories({required int categoryId}) async {
    subCategories = [];
    emit(GetSubCategoriesLoading());
    final response = await _getSubCategoriesListUseCase(categoryId);
    response.fold((l) {
      emit(GetSubCategoriesError(
        error: l.baseErrorModel.message??"",
      ));
    }, (r) {
        subCategories = r.subCategoryDetailsEntity;
      emit(GetSubCategoriesSuccess());
    });
  }
}
