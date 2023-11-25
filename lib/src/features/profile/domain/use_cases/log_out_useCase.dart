import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class LogOutUserUseCase extends BaseUseCase<void, NoParameters> {
  final BaseProfileRepository profileRepository;

  LogOutUserUseCase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await profileRepository.logOut();
  }
}
