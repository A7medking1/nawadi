import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/api/api_consumer.dart';
import 'package:alnawadi/src/features/activities/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/activities/data/model/activity_model.dart';
import 'package:alnawadi/src/features/activities/data/model/compony_model.dart';
import 'package:alnawadi/src/features/activities/data/model/post_sub_activity_model.dart';
import 'package:alnawadi/src/features/activities/data/model/subscriped_activity_model.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_activity_by_category.dart';
import 'package:dio/dio.dart';

class ActivityRemoteDataSourceImpl extends ActivityBaseRemoteDataSource {
  final ApiConsumer apiConsumer;

  ActivityRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<ActivityModel> getActivitiesByCompany(
      GetActivityByCategoryParameters parameters) async {
    final Response response = await apiConsumer.get(
      ApiConstant.activityByCompany(
        parameters.page,
        parameters.categoryId,
      ),
    );

    return ActivityModel.fromJson(response.data['activities']);
  }

  @override
  Future<CompaniesModel> getCompanies(int page) async {
    final Response response =
        await apiConsumer.get(ApiConstant.companies(page));

    return CompaniesModel.fromJson(response.data['companies']);
  }

  @override
  Future<ActivityModel> getAllActivities(int page) async {
    final Response response =
        await apiConsumer.get(ApiConstant.activities(page));

    return ActivityModel.fromJson(response.data['activities']);
  }

  @override
  Future<SubscribedActivitiesModel> getSubscribedActivities(int page) async {
    final Response response =
        await apiConsumer.get(ApiConstant.subscribedActivity(page));

    return SubscribedActivitiesModel.fromJson(
        response.data['subscribedActivities']);
  }

  @override
  Future<void> subToActivity(SubToActivityModel model) async {
    final Response response = await apiConsumer.post(
      ApiConstant.subToActivity,
      queryParameters: model.toJson(),
    );
  }
}
