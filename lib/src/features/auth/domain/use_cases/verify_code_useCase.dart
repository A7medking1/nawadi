import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerifyCodeUseCase extends BaseUseCase<String, VerifyCodeParameters> {
  final BaseAuthRepository authRepository;

  VerifyCodeUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(VerifyCodeParameters parameters) async {
    return await authRepository.verifyCode(parameters);
  }
}

class VerifyCodeParameters extends Equatable {
  final String email;

  final String otp;

  const VerifyCodeParameters({
   required this.email,
   required this.otp,
  });

  @override
  List<Object> get props => [email, otp];
}
