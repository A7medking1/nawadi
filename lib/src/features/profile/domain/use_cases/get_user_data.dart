import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetUserDataUseCase extends BaseUseCase<UserEntity, NoParameters> {
  final BaseProfileRepository profileRepository;

  GetUserDataUseCase(this.profileRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParameters parameters) async {
    return await profileRepository.getUserData();
  }
}
