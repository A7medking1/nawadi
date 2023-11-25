import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/add_product_to_cart.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, CartEntity>> getCartItems();

  Future<Either<Failure, void>> addProductToCart(
      AddProductToCartParameters parameters);

  Future<Either<Failure, void>> reduceQuantityForProduct(int productInCartId);

  Future<Either<Failure, void>> removeProductFromCart(int productInCartId);

  Future<Either<Failure, void>> clearAllCartItems();

  Future<Either<Failure, CartPricesEntity>> applyCoupons(String couponCode);
}
