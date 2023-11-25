import 'package:alnawadi/src/features/activities/data/model/compony_model.dart';
import 'package:alnawadi/src/features/activities/data/model/activity_model.dart';
import 'package:alnawadi/src/features/activities/data/model/post_sub_activity_model.dart';
import 'package:alnawadi/src/features/activities/data/model/subscriped_activity_model.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_activity_by_category.dart';

abstract class ActivityBaseRemoteDataSource {
  Future<CompaniesModel> getCompanies(int page);

  Future<ActivityModel> getAllActivities(int page);

  Future<ActivityModel> getActivitiesByCompany(
    GetActivityByCategoryParameters parameters,
  );


  Future<SubscribedActivitiesModel> getSubscribedActivities(int page);


  Future<void> subToActivity(SubToActivityModel model);



}
