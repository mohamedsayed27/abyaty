import 'package:abyaty/core/base_use_case/base_use_case.dart';
import 'package:abyaty/core/parameters/address_parameters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
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

  AddressCubit() : super(AddressInitial());

  static AddressCubit get(context) => BlocProvider.of(context);

  void postAddress(AddressParameters parameters) async {
    emit(PostAddressLoading());
    final response = await _postAddressUseCase(parameters);
    response.fold((l) {
      emit(PostAddressError(error: l.baseErrorModel.message));
    }, (r) {
      emit(PostAddressSuccess());
    });
  }

  List<AddressDetailsEntity> addressList = [];
  Map<int,int> addressMap = {};
  AddressDetailsEntity? defaultAddress;
  void updateAddress(AddressParameters parameters) async {
    emit(UpdateAddressLoading());
    final response = await _updateAddressUseCase(parameters);
    response.fold((l) {
      emit(UpdateAddressError(error: l.baseErrorModel.message));
    }, (r) {
      emit(UpdateAddressSuccess());
    });
  }

  void deleteAddress(int id) async {
    emit(DeleteAddressLoading());
    final response = await _deleteAddressUseCase(id);
    response.fold((l) {
      emit(DeleteAddressError(error: l.baseErrorModel.message));
    }, (r) {
      emit(DeleteAddressSuccess());
    });
  }

  void showAddress({required int id}) async {
    emit(ShowAddressLoading());
    final response = await _showAddressUseCase(id);
    response.fold((l) {
      emit(ShowAddressError(error: l.baseErrorModel.message));
    }, (r) {
      emit(ShowAddressSuccess());
    });
  }

  void getAddressList() async {
    addressList=[];
    emit(GetListAddressLoading());
    final response = await _getAddressListUseCase(const NoParameters());
    response.fold((l) {
      emit(GetListAddressError(error: l.baseErrorModel.message));
    }, (r) {
      if(r.addressList!=null){
        addressList = r.addressList!;
        for (var element in addressList) {
          addressMap.addAll({element.id!:element.isDefault!});
          if(element.isDefault==1){
            defaultAddress = element;
          }
        }
      }
      emit(GetListAddressSuccess());
    });
  }
  AddressDetailsEntity? changeAddress;
  void updateDefaultAddressLocally(AddressDetailsEntity addressDetailsEntity)async{
    addressMap.updateAll((key, value) => value=0);
    addressMap.update(addressDetailsEntity.id!, (value) => 1);
    changeAddress = addressDetailsEntity;
    emit(UpdateDefaultAddressLocally());
  }
  void updateDefaultAddress(int addressId)async{
    emit(UpdateDefaultAddressLoading());
    final response = await _updateDefaultAddressUseCase(addressId);
    response.fold((l) {
      print(l);
      emit(UpdateDefaultAddressError(error: l.baseErrorModel.message));
    }, (r) {
      getAddressList();
      emit(UpdateDefaultAddressSuccess());
    });
  }
}
