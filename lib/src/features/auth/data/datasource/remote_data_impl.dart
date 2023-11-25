import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/api/api_consumer.dart';
import 'package:alnawadi/src/features/auth/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/auth/data/model/register_model.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/reset_password_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_code_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_email_useCase.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSourceImpl extends AuthBaseRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<String> register(RegisterModel parameters) async {
    final Response response = await apiConsumer.post(
      ApiConstant.register,
      body: parameters.toJson(),
    );
    return response.data['token'];
  }

  @override
  Future<String> login(LoginEntity parameters) async {
    final Response response = await apiConsumer.post(
      ApiConstant.login,
      body: {
        'email': parameters.email,
        'password': parameters.password,
      },
    );
    return response.data['token'];
  }

  @override
  Future<void> verifyEmail(VerifyEmailParameters parameters) async {
    final Response response =
        await apiConsumer.post(ApiConstant.verifyEmail, body: {
      "email": parameters.email,
      "otp": parameters.otp,
    });
  }

  @override
  Future<void> forgetPassword(String email) async {
    final Response response =
        await apiConsumer.post(ApiConstant.forgotPassword, body: {
      "email": email,
    });
  }

  @override
  Future<void> logOut() async {
    final Response response = await apiConsumer.post(
      ApiConstant.logout,
    );
  }

  @override
  Future<void> resendCode(String email) async {
    final Response response =
        await apiConsumer.post(ApiConstant.resendCode, body: {
      "email": email,
    });
  }

  @override
  Future<void> resetPassword(ResetPasswordParameters parameters) async {
    final Response response =
        await apiConsumer.post(ApiConstant.resetPassword, body: {
      "new_password": parameters.password,
      "new_password_confirmation": parameters.confirmPassword,
    });
    //  return response.data['token'];
  }

  @override
  Future<String> verifyCode(VerifyCodeParameters parameters) async {
    final Response response =
        await apiConsumer.post(ApiConstant.verifyCode, body: {
      "email": parameters.email,
      "otp": parameters.otp,
    });
    return response.data['token'];
  }
}
