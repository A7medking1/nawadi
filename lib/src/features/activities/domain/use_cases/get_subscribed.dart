import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/activities/domain/entity/subscriptions_activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetSubscribedActivitiesUseCase
    extends BaseUseCase<SubscribedActivitiesEntity, int> {
  final BaseActivityRepository activityRepository;

  GetSubscribedActivitiesUseCase(this.activityRepository);

  @override
  Future<Either<Failure, SubscribedActivitiesEntity>> call(int parameters) async {
    return await activityRepository.getSubscribedActivities(parameters);
  }
}
