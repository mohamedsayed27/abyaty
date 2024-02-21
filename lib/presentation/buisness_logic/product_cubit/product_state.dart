
abstract class ProductState {}

class ProductInitial extends ProductState {}


class GetProductDetailsLoading extends ProductState {}

class GetProductDetailsSuccess extends ProductState {}

class GetProductDetailsError extends ProductState {
  final String error;

  GetProductDetailsError({required this.error});
}


class ReviewProductLoading extends ProductState {}

class ReviewProductSuccess extends ProductState {}

class ReviewProductError extends ProductState {
  final String error;

  ReviewProductError({required this.error});
}


class GetProductsAttributeLoading extends ProductState {}

class GetProductsAttributeSuccess extends ProductState {}

class GetProductsAttributeError extends ProductState {
  final String error;

  GetProductsAttributeError({required this.error});
}


class GetAllProductLoading extends ProductState {}
class GetPaginatedProductLoading extends ProductState {}

class GetAllProductSuccess extends ProductState {}

class GetAllProductError extends ProductState {
  final String error;

  GetAllProductError({required this.error});
}


class GetTopSellingProductsLoading extends ProductState {}

class GetTopSellingProductsSuccess extends ProductState {}

class GetTopSellingProductsError extends ProductState {
  final String error;

  GetTopSellingProductsError({required this.error});
}


class GetCategoriesLoading extends ProductState {}

class GetCategoriesSuccess extends ProductState {}

class GetCategoriesError extends ProductState {
  final String error;

  GetCategoriesError({required this.error});
}

class GetSubCategoriesLoading extends ProductState {}

class GetSubCategoriesSuccess extends ProductState {}

class GetSubCategoriesError extends ProductState {
  final String error;

  GetSubCategoriesError({required this.error});
}


class GetFavoriteListLoading extends ProductState {}

class GetFavoriteListSuccess extends ProductState {}

class GetFavoriteListError extends ProductState {
  final String error;

  GetFavoriteListError({required this.error});
}


class RemoveFromFavoriteLoading extends ProductState {}

class RemoveFromFavoriteSuccess extends ProductState {}

class RemoveFromFavoriteError extends ProductState {
  final String error;

  RemoveFromFavoriteError({required this.error});
}


class AddToFavoriteLoading extends ProductState {}

class AddToFavoriteSuccess extends ProductState {}

class AddToFavoriteError extends ProductState {
  final String error;

  AddToFavoriteError({required this.error});
}

class GetCartListLoading extends ProductState {}

class GetCartListSuccess extends ProductState {}

class GetCartListError extends ProductState {
  final String error;

  GetCartListError({required this.error});
}


class RemoveFromCartLoading extends ProductState {}

class RemoveFromCartSuccess extends ProductState {}

class RemoveFromCartError extends ProductState {
  final String error;

  RemoveFromCartError({required this.error});
}


class AddToCartLoading extends ProductState {}

class AddToCartSuccess extends ProductState {}

class AddToCartError extends ProductState {
  final String error;

  AddToCartError({required this.error});
}