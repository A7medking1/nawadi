import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/auth/data/model/register_model.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/entity/register_entity.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/reset_password_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_code_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_email_useCase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, String>> register(RegisterModel parameters);

  Future<Either<Failure, String>> login(LoginEntity parameters);

  Future<Either<Failure, void>> verifyEmail(VerifyEmailParameters parameters);

  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, void>> forgetPassword(String email);

  Future<Either<Failure, void>> resendCode(String email);

  Future<Either<Failure, void>> resetPassword(
      ResetPasswordParameters parameters);

  Future<Either<Failure, String>> verifyCode(VerifyCodeParameters parameters);
}
