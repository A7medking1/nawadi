import 'package:alnawadi/src/core/error/exceptions.dart';
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/cart/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/domain/repository/repository.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/add_product_to_cart.dart';
import 'package:dartz/dartz.dart';

class CartRepository extends BaseCartRepository {
  final BaseCartRemoteDataSource remoteDataSource;

  CartRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addProductToCart(
      AddProductToCartParameters parameters) async {
    try {
      final result = await remoteDataSource.addProductToCart(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CartPricesEntity>> applyCoupons(
      String couponCode) async {
    try {
      final result = await remoteDataSource.applyCoupons(couponCode);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> clearAllCartItems() async {
    try {
      final result = await remoteDataSource.clearAllCartItems();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCartItems() async {
    try {
      final result = await remoteDataSource.getCartItems();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> reduceQuantityForProduct(
      int productInCartId) async {
    try {
      final result =
          await remoteDataSource.reduceQuantityForProduct(productInCartId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> removeProductFromCart(
      int productInCartId) async {
    try {
      final result =
          await remoteDataSource.removeProductFromCart(productInCartId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
