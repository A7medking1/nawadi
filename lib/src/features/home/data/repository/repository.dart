import 'package:alnawadi/src/core/error/exceptions.dart';
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/home/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/home/domain/entity/banners.dart';
import 'package:alnawadi/src/features/home/domain/entity/search_entity.dart';
import 'package:alnawadi/src/features/home/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepository extends BaseHomeRepository {
  final HomeBaseRemoteDataSource remoteDataSource;

  HomeRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BannersEntity>>> getBanners() async {
    try {
      final result = await remoteDataSource.getBanners();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SearchEntity>>> getSearchActivity(
      String query) async {
    try {
      final result = await remoteDataSource.getSearchActivity(query);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SearchEntity>>> getSearchProduct(
      String query) async {
    try {
      final result = await remoteDataSource.getSearchProduct(query);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
