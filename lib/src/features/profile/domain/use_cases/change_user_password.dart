import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/data/models/chnage_password.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ChangeUserPasswordUseCase extends BaseUseCase<void, ChangePassModel> {
  final BaseProfileRepository profileRepository;

  ChangeUserPasswordUseCase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(ChangePassModel parameters) async {
    return await profileRepository.changePassword(parameters);
  }
}
