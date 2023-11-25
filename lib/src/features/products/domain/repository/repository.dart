import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_category_entity.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_entity.dart';
import 'package:alnawadi/src/features/products/domain/use_cases/get_product_by_category.dart';
import 'package:dartz/dartz.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, ProductCategoryEntity>> getProductCategory(int page);

  Future<Either<Failure, ProductEntity>> getAllProductCategory(int page);

  Future<Either<Failure, ProductEntity>> getProductByCategory(GetProductByCategoryParameters parameters);
}
