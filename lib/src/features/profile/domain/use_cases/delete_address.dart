import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class DeleteAddressUseCase extends BaseUseCase<void, int> {
  final BaseProfileRepository profileRepository;

  DeleteAddressUseCase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(int parameters) async {
    return await profileRepository.deleteAddress(parameters);
  }
}
