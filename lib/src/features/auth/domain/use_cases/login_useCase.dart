import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCase<String, LoginEntity> {
  final BaseAuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(LoginEntity parameters) async {
    return await authRepository.login(parameters);
  }
}
