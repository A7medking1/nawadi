import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/activities/data/model/post_sub_activity_model.dart';
import 'package:alnawadi/src/features/activities/domain/entity/company_entity.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/entity/subscriptions_activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_activity_by_category.dart';
import 'package:dartz/dartz.dart';

abstract class BaseActivityRepository {
  Future<Either<Failure, CompaniesEntity>> getCompanies(
      int page);

  Future<Either<Failure, ActivityEntity>> getAllActivities(int page);

  Future<Either<Failure, ActivityEntity>> getActivitiesByCompany(
      GetActivityByCategoryParameters parameters);



  Future<Either<Failure,SubscribedActivitiesEntity>> getSubscribedActivities(int page);



  Future<Either<Failure,void>> subToActivity(SubToActivityModel model);





}
