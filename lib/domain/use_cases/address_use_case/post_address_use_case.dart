import 'package:dartz/dartz.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/parameters/address_parameters.dart';
import '../../entities/address_entity/address_response_entity.dart';
import '../../repositories/address_base_repository/address_base_repository.dart';

class PostAddressUseCase
    extends BaseUseCase<AddressResponseEntity, AddressParameters> {
  final AddressBaseRepository addressBaseRepository;

  PostAddressUseCase({required this.addressBaseRepository});

  @override
  Future<Either<ErrorException, AddressResponseEntity>> call(
      AddressParameters parameters) async {
    return await addressBaseRepository.postAddress(addressParameters: parameters);
  }
}
