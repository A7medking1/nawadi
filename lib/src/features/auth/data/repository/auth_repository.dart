import 'package:alnawadi/src/core/error/exceptions.dart';
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/auth/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/auth/data/model/register_model.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/repository/base_auth_repository.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/reset_password_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_code_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_email_useCase.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository {
  final AuthBaseRemoteDataSource remoteDataSource;

  AuthRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> forgetPassword(String email) async {
    try {
      final result = await remoteDataSource.forgetPassword(email);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final result = await remoteDataSource.logOut();

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> login(LoginEntity parameters) async {
    try {
      final result = await remoteDataSource.login(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> register(RegisterModel parameters) async {
    try {
      final result = await remoteDataSource.register(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> resendCode(String email) async {
    try {
      final result = await remoteDataSource.resendCode(email);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(
      ResetPasswordParameters parameters) async {
    try {
      final result = await remoteDataSource.resetPassword(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail(
      VerifyEmailParameters parameters) async {
    try {
      final result = await remoteDataSource.verifyEmail(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> verifyCode(
      VerifyCodeParameters parameters) async {
    try {
      final result = await remoteDataSource.verifyCode(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
