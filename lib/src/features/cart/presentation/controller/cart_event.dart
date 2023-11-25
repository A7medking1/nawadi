part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddProductToCartEvent extends CartEvent {
  final int productId;
  final int quantity;
/*
  final int selectedProduct;
*/

  final bool isIncrease;

  const AddProductToCartEvent({
    required this.productId,
    required this.quantity,
    this.isIncrease = false,
  });

  @override
  List<Object> get props => [productId, quantity];
}

class ReduceQuantityForProductEvent extends CartEvent {
  final int cartId;

  const ReduceQuantityForProductEvent(this.cartId);

  @override
  List<Object> get props => [cartId];
}

class RemoveProductFromCartEvent extends CartEvent {
  final int cartId;

  const RemoveProductFromCartEvent(this.cartId);

  @override
  List<Object> get props => [cartId];
}

class ClearAllCartItemsEvent extends CartEvent {
  const ClearAllCartItemsEvent();

  @override
  List<Object> get props => [];
}

class GetCartItemsEvent extends CartEvent {
  const GetCartItemsEvent();

  @override
  List<Object> get props => [];
}

class ApplyCouponEvent extends CartEvent {
  final String couponCode;

  const ApplyCouponEvent(this.couponCode);

  @override
  List<Object> get props => [couponCode];
}

class RemoveCouponEvent extends CartEvent {
  const RemoveCouponEvent();

  @override
  List<Object> get props => [];
}
