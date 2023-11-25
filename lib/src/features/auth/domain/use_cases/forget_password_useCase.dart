import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/domain/entity/register_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase extends BaseUseCase<void, String> {
  final BaseAuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    return await authRepository.forgetPassword(email);
  }
}
