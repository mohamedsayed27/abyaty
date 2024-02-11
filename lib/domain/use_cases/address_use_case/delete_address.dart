import 'package:dartz/dartz.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../entities/base.dart';
import '../../repositories/address_base_repository/address_base_repository.dart';

class DeleteAddressUseCase extends BaseUseCase<BaseResponseEntity, int> {
  final AddressBaseRepository addressBaseRepository;

  DeleteAddressUseCase({required this.addressBaseRepository});

  @override
  Future<Either<ErrorException, BaseResponseEntity>> call(
    int parameters,
  ) async {
    return await addressBaseRepository.deleteAddress(
      addressId: parameters,
    );
  }
}
