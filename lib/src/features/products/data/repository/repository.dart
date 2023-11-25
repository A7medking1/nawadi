import 'package:alnawadi/src/core/error/exceptions.dart';
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/products/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_category_entity.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_entity.dart';
import 'package:alnawadi/src/features/products/domain/repository/repository.dart';
import 'package:alnawadi/src/features/products/domain/use_cases/get_product_by_category.dart';
import 'package:dartz/dartz.dart';

class ProductsRepository extends BaseProductsRepository {
  final ProductsBaseRemoteDataSource remoteDataSource;

  ProductsRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, ProductEntity>> getAllProductCategory(int page) async {
    try {
      final result = await remoteDataSource.getAllProduct(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductByCategory(
      GetProductByCategoryParameters parameters) async {
    try {
      final result = await remoteDataSource.getProductByCategory(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ProductCategoryEntity>> getProductCategory(
      int page) async {
    try {
      final result = await remoteDataSource.getProductCategory(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
