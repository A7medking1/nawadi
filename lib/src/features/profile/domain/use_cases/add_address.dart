import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class AddAddressUseCase extends BaseUseCase<void, AddressEntity> {
  final BaseProfileRepository profileRepository;

  AddAddressUseCase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(AddressEntity parameters) async {
    return await profileRepository.addAddress(parameters);
  }
}
