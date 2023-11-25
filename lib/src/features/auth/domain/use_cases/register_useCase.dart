import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/data/model/register_model.dart';
import 'package:alnawadi/src/features/auth/domain/entity/register_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase extends BaseUseCase<String, RegisterModel> {
  final BaseAuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(RegisterModel parameters) async {
    return await authRepository.register(parameters);
  }
}
