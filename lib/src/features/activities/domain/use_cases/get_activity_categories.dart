import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/activities/domain/entity/company_entity.dart';
import 'package:alnawadi/src/features/activities/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetActivityCategoryUseCase
    extends BaseUseCase<CompaniesEntity, int> {
  final BaseActivityRepository activityRepository;

  GetActivityCategoryUseCase(this.activityRepository);

  @override
  Future<Either<Failure, CompaniesEntity>> call(int page) async {
    return await activityRepository.getCompanies(page);
  }
}
