

import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetActivityByCategoryUseCase
    extends BaseUseCase<ActivityEntity, GetActivityByCategoryParameters> {
  final BaseActivityRepository activityRepository;

  GetActivityByCategoryUseCase(this.activityRepository);

  @override
  Future<Either<Failure, ActivityEntity>> call(
      GetActivityByCategoryParameters parameters) async {
    return await activityRepository.getActivitiesByCompany(parameters);
  }
}

class GetActivityByCategoryParameters extends Equatable {
  final int page;

  final int categoryId;

  const GetActivityByCategoryParameters(this.page, this.categoryId);

  @override
  List<Object> get props => [page, categoryId];
}
