import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/domain/entity/register_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class ResendCodeUseCase extends BaseUseCase<void, String> {
  final BaseAuthRepository authRepository;

  ResendCodeUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    return await authRepository.resendCode(email);
  }
}
