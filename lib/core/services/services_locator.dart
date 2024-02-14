import 'package:abyaty/domain/use_cases/categories_use_case/get_categories_list_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/remote_datasource/address_datasource.dart';
import '../../data/datasource/remote_datasource/auth_datasource.dart';
import '../../data/datasource/remote_datasource/categories_datasource.dart';
import '../../data/datasource/remote_datasource/products_remote_data_source.dart';
import '../../data/datasource/remote_datasource/profile_datasource.dart';
import '../../data/repository/address_repository/address_repository.dart';
import '../../data/repository/auth_repository/auth_repository.dart';
import '../../data/repository/categories_repository/categories_repository.dart';
import '../../data/repository/product_repository/product_repository.dart';
import '../../data/repository/profile_repository/profile_repository.dart';
import '../../domain/repositories/address_base_repository/address_base_repository.dart';
import '../../domain/repositories/auth_base_repository/auth_base_repository.dart';
import '../../domain/repositories/categories_base_repository/categories_base_repository.dart';
import '../../domain/repositories/product_base_repository/products_base_repository.dart';
import '../../domain/repositories/profile_base_repository/profile_base_repository.dart';
import '../../domain/use_cases/address_use_case/delete_address.dart';
import '../../domain/use_cases/address_use_case/get_address_list_use_case.dart';
import '../../domain/use_cases/address_use_case/post_address_use_case.dart';
import '../../domain/use_cases/address_use_case/show_address_use_case.dart';
import '../../domain/use_cases/address_use_case/update_address_use_case.dart';
import '../../domain/use_cases/address_use_case/update_default_address.dart';
import '../../domain/use_cases/auth_usecases/login_usecase.dart';
import '../../domain/use_cases/auth_usecases/register_use_case.dart';
import '../../domain/use_cases/categories_use_case/sub_category_use_case.dart';
import '../../domain/use_cases/products_use_case/add_product_to_cart_use_case.dart';
import '../../domain/use_cases/products_use_case/add_product_to_favorite_use_case.dart';
import '../../domain/use_cases/products_use_case/get_all_products_use_case.dart';
import '../../domain/use_cases/products_use_case/get_cart_list_use_case.dart';
import '../../domain/use_cases/products_use_case/get_favorite_products_use_case.dart';
import '../../domain/use_cases/products_use_case/get_product_attributes_use_case.dart';
import '../../domain/use_cases/products_use_case/get_product_details_use_case.dart';
import '../../domain/use_cases/products_use_case/get_top_selling_use_case.dart';
import '../../domain/use_cases/products_use_case/remove_product_from_cart_use_case.dart';
import '../../domain/use_cases/products_use_case/remove_product_from_favorite_use_case.dart';
import '../../domain/use_cases/products_use_case/review_product_use_case.dart';
import '../network/dio_helper.dart';
import 'maps_services.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {


    // sl.registerLazySingleton(() => GoogleMapsServices());

    ///USE CASES

    /// Auth UseCases
    sl.registerLazySingleton(() => LoginUseCase(
          authBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => RegisterUseCase(
          authBaseRepository: sl(),
        ));

    /// Address UseCases
    sl.registerLazySingleton(() => DeleteAddressUseCase(
          addressBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => PostAddressUseCase(
          addressBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => UpdateAddressUseCase(
          addressBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => ShowAddressUseCase(
          addressBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetAddressListUseCase(
          addressBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => UpdateDefaultAddressUseCase(
          addressBaseRepository: sl(),
        ));

    /// Categories Use Case
    sl.registerLazySingleton(() => GetCategoriesListUseCase(
          categoriesBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetSubCategoriesListUseCase(
          categoriesBaseRepository: sl(),
        ));

    /// Product UseCases
    sl.registerLazySingleton(() => AddProductToCartUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => AddProductToFavoriteUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetAllProductUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetCartListUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetFavoriteProductsUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetProductAttributesUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetProductDetailsUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => GetTopSellingProductUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => RemoveProductFromFavoriteUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => RemoveProductFromCartUseCase(
          productBaseRepository: sl(),
        ));
    sl.registerLazySingleton(() => ReviewProductUseCase(
          productBaseRepository: sl(),
        ));

    ///REPOSITORY
    sl.registerLazySingleton<AuthBaseRepository>(
        () => AuthRepository(authBaseRemoteDataSource: sl()));
    sl.registerLazySingleton<AddressBaseRepository>(
        () => AddressRepository(addressBaseRemoteDatasource: sl()));
    sl.registerLazySingleton<ProfileBaseRepository>(
        () => ProfileRepository(profileBaseRemoteDataSource: sl()));
    sl.registerLazySingleton<CategoriesBaseRepository>(
        () => CategoriesRepository(categoriesBaseRemoteDatasource: sl()));
    sl.registerLazySingleton<ProductBaseRepository>(
        () => ProductRepository(productBaseRemoteDataSource: sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSource(dioHelper: sl()));
    sl.registerLazySingleton<AddressBaseRemoteDatasource>(
        () => AddressRemoteDataSource(dioHelper: sl()));
    sl.registerLazySingleton<ProfileBaseRemoteDataSource>(
        () => ProfileRemoteDataSource(dioHelper: sl()));
    sl.registerLazySingleton<CategoriesRemoteBaseDatasource>(
        () => CategoriesRemoteDatasource(dioHelper: sl()));
    sl.registerLazySingleton<ProductBaseRemoteDataSource>(
        () => ProductRemoteDataSource(dioHelper: sl()));

    /// API Methods Class (DIO)
    sl.registerLazySingleton(() => DioHelper());
  }
}
