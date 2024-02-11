
import 'package:dartz/dartz.dart';
import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error_exception.dart';
import '../../../core/parameters/login_parameters.dart';
import '../../entities/address_entity/get_address_list_entity.dart';
import '../../entities/auth_entities/login_entity.dart';
import '../../repositories/address_base_repository/address_base_repository.dart';
import '../../repositories/auth_base_repository/auth_base_repository.dart';

class GetAddressListUseCase extends BaseUseCase<GetAddressListEntity,NoParameters>{
  final AddressBaseRepository addressBaseRepository;

  GetAddressListUseCase({required this.addressBaseRepository});

  @override
  Future<Either<ErrorException, GetAddressListEntity>> call(NoParameters parameters) async{
    return await addressBaseRepository.getAddressList();
  }


}