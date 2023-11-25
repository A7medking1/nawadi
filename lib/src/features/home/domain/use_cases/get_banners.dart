import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/home/domain/entity/banners.dart';
import 'package:alnawadi/src/features/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetBannersUseCase
    extends BaseUseCase<List<BannersEntity>, NoParameters> {
  final BaseHomeRepository homeRepository;

  GetBannersUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BannersEntity>>> call(
      NoParameters parameters) async {
    return await homeRepository.getBanners();
  }
}
