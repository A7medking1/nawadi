import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetAllActivityUseCase extends BaseUseCase<ActivityEntity, int> {
  final BaseActivityRepository activityRepository;

  GetAllActivityUseCase(this.activityRepository);

  @override
  Future<Either<Failure, ActivityEntity>> call(int page) async {
    return await activityRepository.getAllActivities(page);
  }
}
