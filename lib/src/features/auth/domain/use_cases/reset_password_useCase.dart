import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordUseCase extends BaseUseCase<void, ResetPasswordParameters> {
  final BaseAuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(ResetPasswordParameters parameters) async {
    return await authRepository.resetPassword(parameters);
  }
}

class ResetPasswordParameters extends Equatable {
  final String password;

  final String confirmPassword;

  const ResetPasswordParameters({
    required this.confirmPassword,
    required this.password,
  });

  @override
  List<Object> get props => [password, confirmPassword];
}
