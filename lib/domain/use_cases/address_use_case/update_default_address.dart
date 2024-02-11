import 'package:dartz/dartz.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../entities/base.dart';
import '../../repositories/address_base_repository/address_base_repository.dart';

class UpdateDefaultAddressUseCase extends BaseUseCase<BaseResponseEntity, int> {
  final AddressBaseRepository addressBaseRepository;

  UpdateDefaultAddressUseCase({required this.addressBaseRepository,});

  @override
  Future<Either<ErrorException, BaseResponseEntity>> call(
      int parameters,
      ) async {
    return await addressBaseRepository.updatedDefaultAddress(
      addressId: parameters,
    );
  }
}
