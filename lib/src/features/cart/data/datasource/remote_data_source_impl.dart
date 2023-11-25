import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/api/api_consumer.dart';
import 'package:alnawadi/src/features/cart/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/cart/data/models/cartModel.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/add_product_to_cart.dart';
import 'package:dio/dio.dart';

class CartRemoteDataSource extends BaseCartRemoteDataSource {
  final ApiConsumer apiConsumer;

  CartRemoteDataSource(this.apiConsumer);

  @override
  Future<void> addProductToCart(AddProductToCartParameters parameters) async {
    final Response response = await apiConsumer.post(
      ApiConstant.addToCart(
        parameters.productId,
        parameters.quantity,
      ),
    );
  }

  @override
  Future<CartPricesModel> applyCoupons(String couponCode) async {
    final Response response = await apiConsumer.post(
      ApiConstant.applyCoupons(
        couponCode,
      ),
    );
    return CartPricesModel.fromJson(response.data['cart_prices']);
  }

  @override
  Future<void> clearAllCartItems() async {
    final Response response = await apiConsumer.delete(
      ApiConstant.clearAllCartItems,
    );
  }

  @override
  Future<CartModel> getCartItems() async {
    final Response response = await apiConsumer.get(ApiConstant.cartItems);

    return CartModel.fromJson(response.data);
  }

  @override
  Future<void> reduceQuantityForProduct(int productInCartId) async {
    final Response response = await apiConsumer.post(
      ApiConstant.reduceQuantity(
        productInCartId,
      ),
    );
  }

  @override
  Future<void> removeProductFromCart(int productInCartId) async {
    final Response response = await apiConsumer.delete(
      ApiConstant.removeProductFromCart(
        productInCartId,
      ),
    );
  }
}
