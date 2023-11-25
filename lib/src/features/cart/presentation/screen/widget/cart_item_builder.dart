import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/widget/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsBuilder extends StatelessWidget {
  const CartItemsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.cartEntity!.items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CartItems(
              cartItemsEntity: state.cartEntity!.items[index],
            );
          },
        );
      },
    );
  }
}
