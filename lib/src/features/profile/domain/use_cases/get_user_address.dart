import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetAddressUseCase extends BaseUseCase<List<AddressEntity>, NoParameters> {
  final BaseProfileRepository profileRepository;

  GetAddressUseCase(this.profileRepository);

  @override
  Future<Either<Failure, List<AddressEntity>>> call(NoParameters parameters) async {
    return await profileRepository.getUserAddress();
  }
}
