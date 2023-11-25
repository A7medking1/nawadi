import 'package:alnawadi/src/features/cart/data/models/cartModel.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/add_product_to_cart.dart';

abstract class BaseCartRemoteDataSource {
  Future<CartModel> getCartItems();

  Future<void> addProductToCart(AddProductToCartParameters parameters);

  Future<void> reduceQuantityForProduct(int productInCartId);

  Future<void> removeProductFromCart(int productInCartId);

  Future<void> clearAllCartItems();

 // Future<CartPricesEntity> applyCoupons(String couponCode);
  Future<CartPricesModel> applyCoupons(String couponCode);
}
