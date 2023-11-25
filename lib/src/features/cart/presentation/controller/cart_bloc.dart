import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/form_field_widget.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/add_product_to_cart.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/apply_coupon.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/clear_all_cart_items.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/get_cart_items.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/reduce_quantity_product.dart';
import 'package:alnawadi/src/features/cart/domain/use_cases/remove_product_from_cart.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(
      this.addProductToCartUseCase,
      this.reduceQuantityForProductUseCase,
      this.removeProductFromCartUseCase,
      this.clearAllCartItemsUseCase,
      this.applyCouponUseCase,
      this.getCartItemsUseCase)
      : super(const CartState()) {
    on<GetCartItemsEvent>(_getCartItems);
    on<AddProductToCartEvent>(_addProductToCart);
    on<ReduceQuantityForProductEvent>(_reduceQuantity);
    on<RemoveProductFromCartEvent>(_removeProductFromCart);
    on<ClearAllCartItemsEvent>(_clearAllProductFromCart);
    on<ApplyCouponEvent>(_applyCoupons);
    on<RemoveCouponEvent>(_removeCoupon);
  }

  final AddProductToCartUseCase addProductToCartUseCase;

  final ReduceQuantityForProductUseCase reduceQuantityForProductUseCase;

  final RemoveProductFromCartUseCase removeProductFromCartUseCase;

  final ClearAllCartItemsUseCase clearAllCartItemsUseCase;

  final ApplyCouponUseCase applyCouponUseCase;

  final GetCartItemsUseCase getCartItemsUseCase;

  final TextEditingController couponController = TextEditingController();

  FutureOr<void> _getCartItems(
    GetCartItemsEvent event,
    Emitter<CartState> emit,
  ) async {
    //emit(state.copyWith(getCartItemsReqState: ReqState.loading));

    final result = await getCartItemsUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          getCartItemsReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.items.isEmpty) {
          emit(state.copyWith(
            getCartItemsReqState: ReqState.empty,
          ));
        } else {
          emit(
            state.copyWith(
              cartEntity: r,
              getCartItemsReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _addProductToCart(
      AddProductToCartEvent event, Emitter<CartState> emit) async {
    emit(
      state.copyWith(
        addProductToCartReqState: ReqState.loading,
      ),
    );

    final result = await addProductToCartUseCase(
      AddProductToCartParameters(
        productId: event.productId,
        quantity: event.quantity,
      ),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          addProductToCartReqState: ReqState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addProductToCartReqState: ReqState.success,
          ),
        );
        if (event.isIncrease && couponController.text.isNotEmpty) {
          add(ApplyCouponEvent(couponController.text));
        }
        if (!event.isIncrease) {
          showToast(msg: 'Added To Cart', state: ToastStates.SUCCESS);
        }

        add(const GetCartItemsEvent());
      },
    );
  }

  FutureOr<void> _reduceQuantity(
      ReduceQuantityForProductEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(reduceQuantityForProductReqState: ReqState.loading));

    final result = await reduceQuantityForProductUseCase(event.cartId);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          reduceQuantityForProductReqState: ReqState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            reduceQuantityForProductReqState: ReqState.success,
          ),
        );
        if (couponController.text.isNotEmpty) {
          add(ApplyCouponEvent(couponController.text));
        }

        add(const GetCartItemsEvent());
      },
    );
  }

  FutureOr<void> _removeProductFromCart(
      RemoveProductFromCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(removeFromCartReqState: ReqState.loading));

    final result = await removeProductFromCartUseCase(event.cartId);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          removeFromCartReqState: ReqState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            removeFromCartReqState: ReqState.success,
          ),
        );
        add(const GetCartItemsEvent());
      },
    );
  }

  FutureOr<void> _clearAllProductFromCart(
      ClearAllCartItemsEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(clearCartItemsReqState: ReqState.loading));

    final result = await clearAllCartItemsUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          clearCartItemsReqState: ReqState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            clearCartItemsReqState: ReqState.success,
          ),
        );
        add(const GetCartItemsEvent());
      },
    );
  }

  FutureOr<void> _applyCoupons(
      ApplyCouponEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(applyCouponReqState: ReqState.loading));

    final result = await applyCouponUseCase(event.couponCode);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            message: l.message,
            cartCoupon:
                const CartPricesEntity(subtotal: 0, totalDiscount: 0, total: 0),
            applyCouponReqState: ReqState.error,
          ),
        );
        showToast(msg: l.message, state: ToastStates.ERROR);
      },
      (r) {
        emit(
          state.copyWith(
            cartCoupon: r,
            applyCouponReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _removeCoupon(
      RemoveCouponEvent event, Emitter<CartState> emit) async {
    couponController.text = '';
    emit(state.copyWith(
        cartCoupon:
            const CartPricesEntity(subtotal: 0, totalDiscount: 0, total: 0)));
  }
}
