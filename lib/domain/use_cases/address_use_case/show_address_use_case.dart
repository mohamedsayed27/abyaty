import 'package:dartz/dartz.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../entities/address_entity/address_response_entity.dart';
import '../../repositories/address_base_repository/address_base_repository.dart';

class ShowAddressUseCase
    extends BaseUseCase<AddressResponseEntity, int> {
  final AddressBaseRepository addressBaseRepository;

  ShowAddressUseCase({required this.addressBaseRepository});

  @override
  Future<Either<ErrorException, AddressResponseEntity>> call(
      int parameters) async {
    return await addressBaseRepository.showAddress(addressId: parameters);
  }
}
