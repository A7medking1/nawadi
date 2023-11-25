import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogOutUseCase extends BaseUseCase<void, NoParameters> {
  final BaseAuthRepository authRepository;

  LogOutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await authRepository.logOut();
  }
}
