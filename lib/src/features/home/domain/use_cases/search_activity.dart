import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/home/domain/entity/search_entity.dart';
import 'package:alnawadi/src/features/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class SearchActivityUseCase extends BaseUseCase<List<SearchEntity>, String> {
  final BaseHomeRepository homeRepository;

  SearchActivityUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<SearchEntity>>> call(String parameters) async {
    return await homeRepository.getSearchActivity(parameters);
  }
}
