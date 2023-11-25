import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/activities/data/model/post_sub_activity_model.dart';
import 'package:alnawadi/src/features/activities/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class SubToActivityUseCase extends BaseUseCase<void, SubToActivityModel> {
  final BaseActivityRepository activityRepository;

  SubToActivityUseCase(this.activityRepository);

  @override
  Future<Either<Failure, void>> call(SubToActivityModel parameters) async {
    return await activityRepository.subToActivity(parameters);
  }
}
