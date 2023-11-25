import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerifyEmailUseCase extends BaseUseCase<void, VerifyEmailParameters> {
  final BaseAuthRepository authRepository;

  VerifyEmailUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(VerifyEmailParameters parameters) async {
    return await authRepository.verifyEmail(parameters);
  }
}

class VerifyEmailParameters extends Equatable {
  final String email;

  final String otp;

  const VerifyEmailParameters({
   required this.email,
   required this.otp,
  });

  @override
  List<Object> get props => [email, otp];
}
