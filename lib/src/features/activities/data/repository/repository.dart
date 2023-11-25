import 'package:alnawadi/src/core/error/exceptions.dart';
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/activities/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/activities/data/model/post_sub_activity_model.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/entity/company_entity.dart';
import 'package:alnawadi/src/features/activities/domain/entity/subscriptions_activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/repository/repository.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_activity_by_category.dart';
import 'package:dartz/dartz.dart';

class ActivityRepository extends BaseActivityRepository {
  final ActivityBaseRemoteDataSource remoteDataSource;

  ActivityRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, ActivityEntity>> getActivitiesByCompany(
      GetActivityByCategoryParameters parameters) async {
    try {
      final result = await remoteDataSource.getActivitiesByCompany(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CompaniesEntity>> getCompanies(int page) async {
    try {
      final result = await remoteDataSource.getCompanies(page);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ActivityEntity>> getAllActivities(int page) async {
    try {
      final result = await remoteDataSource.getAllActivities(page);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SubscribedActivitiesEntity>> getSubscribedActivities(
      int page) async {
    try {
      final result = await remoteDataSource.getSubscribedActivities(page);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> subToActivity(SubToActivityModel model) async {
    try {
      final result = await remoteDataSource.subToActivity(model);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
