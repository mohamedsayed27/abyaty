import 'dart:async';

import 'package:abyaty/core/base_use_case/base_use_case.dart';
import 'package:abyaty/core/parameters/address_parameters.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/assets_path/images_path.dart';
import '../../../core/constants/route_exports.dart';
import '../../../core/services/maps_services.dart';
import '../../../core/services/services_locator.dart';
import '../../../data/models/address_model/place_result_model.dart';
import '../../../domain/entities/address_entity/address_details_entity.dart';
import '../../../domain/use_cases/address_use_case/delete_address.dart';
import '../../../domain/use_cases/address_use_case/get_address_list_use_case.dart';
import '../../../domain/use_cases/address_use_case/post_address_use_case.dart';
import '../../../domain/use_cases/address_use_case/show_address_use_case.dart';
import '../../../domain/use_cases/address_use_case/update_address_use_case.dart';
import '../../../domain/use_cases/address_use_case/update_default_address.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final PostAddressUseCase _postAddressUseCase = sl();
  final UpdateAddressUseCase _updateAddressUseCase = sl();
  final DeleteAddressUseCase _deleteAddressUseCase = sl();
  final ShowAddressUseCase _showAddressUseCase = sl();
  final GetAddressListUseCase _getAddressListUseCase = sl();
  final UpdateDefaultAddressUseCase _updateDefaultAddressUseCase = sl();
  final GoogleMapsServices _mapService = sl();

  AddressCubit() : super(AddressInitial());

  static AddressCubit get(context) => BlocProvider.of(context);

  Set<Marker> markers = {};

  /// Add Location Manually Text editing controllers
  final TextEditingController addManuallyLabel = TextEditingController();
  final TextEditingController addManuallyDetails = TextEditingController();
  final TextEditingController addManuallyArea = TextEditingController();
  final TextEditingController addManuallyFloorNumber = TextEditingController();
  final TextEditingController addManuallyFlatNumber = TextEditingController();

  /// Confirm Location Text editing controllers
  final TextEditingController confirmLocationLabel = TextEditingController();
  final TextEditingController confirmLocationDetails = TextEditingController();
  final TextEditingController confirmLocationFloorNumber =
      TextEditingController();
  final TextEditingController confirmLocationFlatNumber =
      TextEditingController();

  final Completer<GoogleMapController> mapController =
  Completer<GoogleMapController>();
  int? isDefault;

  void postAddress(AddressParameters parameters) async {
    emit(PostAddressLoading());
    final response = await _postAddressUseCase(parameters);
    response.fold((l) {
      emit(PostAddressError(error: l.baseErrorModel.message ?? ""));
    }, (r) {
      emit(PostAddressSuccess(addressResponseEntity: r));
      clearAddressData();
    });
  }

  void clearAddressData(){
     addManuallyLabel.clear() ;
     addManuallyDetails.clear() ;
     addManuallyArea.clear() ;
     addManuallyFloorNumber.clear() ;
     addManuallyFlatNumber.clear() ;
     confirmLocationLabel.clear() ;
     confirmLocationDetails.clear() ;
     confirmLocationFloorNumber.clear() ;
     confirmLocationFlatNumber.clear() ;
  }
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void getCurrentMarker() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      ImagesPath.locationTick,
    ).then((value) {
      currentIcon = value;
    });
  }

  List<AddressDetailsEntity> addressList = [];
  Map<int, int> addressMap = {};
  AddressDetailsEntity? defaultAddress;

  void updateAddress(AddressParameters parameters) async {
    emit(UpdateAddressLoading());
    final response = await _updateAddressUseCase(parameters);
    response.fold((l) {
      emit(UpdateAddressError(error: l.baseErrorModel.message ?? ""));
    }, (r) {
      emit(UpdateAddressSuccess());
    });
  }

  void deleteAddress(int id) async {
    emit(DeleteAddressLoading());
    final response = await _deleteAddressUseCase(id);
    response.fold((l) {
      emit(DeleteAddressError(error: l.baseErrorModel.message ?? ""));
    }, (r) {
      emit(DeleteAddressSuccess());
    });
  }

  void showAddress({required int id}) async {
    emit(ShowAddressLoading());
    final response = await _showAddressUseCase(id);
    response.fold((l) {
      emit(ShowAddressError(error: l.baseErrorModel.message ?? ""));
    }, (r) {
      emit(ShowAddressSuccess());
    });
  }

  void getAddressList() async {
    addressList = [];
    emit(GetListAddressLoading());
    final response = await _getAddressListUseCase(const NoParameters());
    response.fold((l) {
      emit(GetListAddressError(error: l.baseErrorModel.message ?? ""));
    }, (r) {
      if (r.addressList != null) {
        addressList = r.addressList!;
        for (var element in addressList) {
          addressMap.addAll({element.id!: element.isDefault!});
          if (element.isDefault == 1) {
            defaultAddress = element;
          }
        }
      }
      emit(GetListAddressSuccess());
    });
  }

  AddressDetailsEntity? changeAddress;

  void updateDefaultAddressLocally(
      AddressDetailsEntity? addressDetailsEntity) async {
    addressMap.updateAll((key, value) => value = 0);
    if (addressDetailsEntity != null) {
      addressMap.update(addressDetailsEntity.id!, (value) => 1);
    }
    changeAddress = addressDetailsEntity;
    emit(UpdateDefaultAddressLocally());
  }

  void updateDefaultAddress(int addressId) async {
    emit(UpdateDefaultAddressLoading());
    final response = await _updateDefaultAddressUseCase(addressId);
    response.fold((l) {
      emit(UpdateDefaultAddressError(error: l.baseErrorModel.message ?? ""));
    }, (r) {
      getAddressList();
      emit(UpdateDefaultAddressSuccess());
    });
  }

  Position? userCurrentPosition;

  bool getUserLocationLoading = false;

  void getCurrentPosition() async {
    markers = {};
    getUserLocationLoading = true;
    emit(GetCurrentLocationLoading());
    try {
      // print(await MapService.getCurrentPosition());
      userCurrentPosition = await _mapService.getCurrentPosition();

      addMarker(
        LatLng(
          userCurrentPosition!.latitude,
          userCurrentPosition!.longitude,
        ),
      );
      getUserLocationLoading = false;
      emit(GetCurrentLocationPositionSuccess());
    } catch (e) {
      getUserLocationLoading = false;
      emit(GetCurrentLocationPositionError());
    }
  }

  LocationDescription? locationDetails;

  void addMarker(LatLng pos) async {
    markers = {};
    final country =
        await _mapService.getUserAddress(lat: pos.latitude, lng: pos.latitude);
    final address = await getLocationDescription(pos:pos);
    markers.add(
      Marker(
        markerId: MarkerId(pos.toString()),
        position: pos,
        icon: currentIcon,
        infoWindow: InfoWindow(
          title: country[0].country,
          snippet: address?.formattedAddress ?? "",
        ),
      ),
    );
    emit(AddMarker());
  }

  Future<LocationDescription?> getLocationDescription({required LatLng pos}) async {
    emit(GetLocationDescriptionLoading());
    locationDetails = await _mapService.getLocationDescription(
      pos.latitude,
      pos.longitude,
    );
    emit(GetLocationDescriptionSuccess());
    return locationDetails;
  }

  final dio = Dio();
  List<PlaceResult> searchResults = [];

  void searchPlaces(String query) async {
    emit(GetSearchedLocationsLoading());
    searchResults = await _mapService.searchPlaces(query);
    emit(GetSearchedLocationsSuccess());
  }

  void clearSearchedResult() async {
    searchResults.clear();
    emit(ClearSearchedAddressList());
  }

  void animateCameraToPosition({
    required double lat,
    required double lng,
  }) async {
    markers.clear();
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            lat,
            lng,
          ),
          zoom: 15,
        ),
      ),
    );
    addMarker(
      LatLng(
        lat,
        lng,
      ),
    );
    emit(AnimateCameraToPosition());
  }
}
