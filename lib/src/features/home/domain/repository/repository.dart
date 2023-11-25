import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/home/domain/entity/banners.dart';
import 'package:alnawadi/src/features/home/domain/entity/search_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseHomeRepository {

  Future<Either<Failure, List<BannersEntity>>> getBanners();


  Future<Either<Failure,List<SearchEntity>>> getSearchProduct(String query);
  Future<Either<Failure,List<SearchEntity>>> getSearchActivity(String query);



}
