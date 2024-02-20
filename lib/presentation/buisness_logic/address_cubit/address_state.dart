import '../../../domain/entities/address_entity/address_response_entity.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class PostAddressLoading extends AddressState {}

class PostAddressSuccess extends AddressState {
  final AddressResponseEntity addressResponseEntity;

  PostAddressSuccess({required this.addressResponseEntity});
}

class PostAddressError extends AddressState {
  final String error;

  PostAddressError({
    required this.error,
  });
}

class UpdateAddressLoading extends AddressState {}

class UpdateAddressSuccess extends AddressState {}

class UpdateAddressError extends AddressState {
  final String error;

  UpdateAddressError({
    required this.error,
  });
}

class ShowAddressLoading extends AddressState {}

class ShowAddressSuccess extends AddressState {}

class ShowAddressError extends AddressState {
  final String error;

  ShowAddressError({
    required this.error,
  });
}

class GetListAddressLoading extends AddressState {}

class GetListAddressSuccess extends AddressState {}

class GetListAddressError extends AddressState {
  final String error;

  GetListAddressError({
    required this.error,
  });
}

class UpdateDefaultAddressLocally extends AddressState {}
class UpdateDefaultAddressLoading extends AddressState {}
class UpdateDefaultAddressSuccess extends AddressState {}
class UpdateDefaultAddressError extends AddressState {

  final String error;

  UpdateDefaultAddressError({
    required this.error,
  });
}
class GetCurrentLocationLoading extends AddressState {}
class GetCurrentLocationPositionSuccess extends AddressState {}
class GetCurrentLocationPositionError extends AddressState {}
class AddMarker extends AddressState {}
class GetLocationDescriptionLoading extends AddressState {}
class GetLocationDescriptionSuccess extends AddressState {}
class GetSearchedLocationsLoading extends AddressState {}
class ClearSearchedAddressList extends AddressState {}
class AnimateCameraToPosition extends AddressState {}
class GetSearchedLocationsSuccess extends AddressState {}
class DeleteAddressLoading extends AddressState {}

class DeleteAddressSuccess extends AddressState {}

class DeleteAddressError extends AddressState {
  final String error;

  DeleteAddressError({
    required this.error,
  });
}
