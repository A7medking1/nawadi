import 'package:alnawadi/src/features/auth/data/model/register_model.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/reset_password_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_code_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_email_useCase.dart';

abstract class AuthBaseRemoteDataSource {
  Future<String> register(RegisterModel parameters);

  Future<String> login(LoginEntity parameters);

  Future<void> verifyEmail(VerifyEmailParameters parameters);

  Future<void> logOut();

  Future<void> forgetPassword(String email);

  Future<void> resendCode(String email);

  Future<void> resetPassword(ResetPasswordParameters parameters);

  Future<String> verifyCode(VerifyCodeParameters parameters);
}
