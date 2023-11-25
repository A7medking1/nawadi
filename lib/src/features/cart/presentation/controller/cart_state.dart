part of 'cart_bloc.dart';

class CartState extends Equatable {
  final ReqState? addProductToCartReqState;

  final ReqState? reduceQuantityForProductReqState;

  final ReqState? removeFromCartReqState;

  final ReqState? clearCartItemsReqState;

  final ReqState? getCartItemsReqState;

  final ReqState? applyCouponReqState;

  final CartEntity? cartEntity;
  final CartPricesEntity cartCoupon;

  final String message;

  const CartState({
    this.addProductToCartReqState,
    this.reduceQuantityForProductReqState,
    this.removeFromCartReqState,
    this.clearCartItemsReqState,
    this.getCartItemsReqState = ReqState.loading,
    this.applyCouponReqState,
    this.cartEntity,
    this.message = '',
    this.cartCoupon =
        const CartPricesEntity(subtotal: 0, totalDiscount: 0, total: 0),
  });

  CartState copyWith({
    ReqState? addProductToCartReqState,
    ReqState? reduceQuantityForProductReqState,
    ReqState? removeFromCartReqState,
    ReqState? clearCartItemsReqState,
    ReqState? getCartItemsReqState,
    ReqState? applyCouponReqState,
    CartEntity? cartEntity,
    String? message,
    CartPricesEntity? cartCoupon,
  }) {
    return CartState(
      cartCoupon: cartCoupon ?? this.cartCoupon,
      addProductToCartReqState:
          addProductToCartReqState ?? this.addProductToCartReqState,
      removeFromCartReqState:
          removeFromCartReqState ?? this.removeFromCartReqState,
      clearCartItemsReqState:
          clearCartItemsReqState ?? this.clearCartItemsReqState,
      getCartItemsReqState: getCartItemsReqState ?? this.getCartItemsReqState,
      applyCouponReqState: applyCouponReqState ?? this.applyCouponReqState,
      cartEntity: cartEntity ?? this.cartEntity,
      reduceQuantityForProductReqState: reduceQuantityForProductReqState ??
          this.reduceQuantityForProductReqState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        addProductToCartReqState,
        reduceQuantityForProductReqState,
        removeFromCartReqState,
        clearCartItemsReqState,
        getCartItemsReqState,
        applyCouponReqState,
        cartEntity,
        cartCoupon,
      ];
}
