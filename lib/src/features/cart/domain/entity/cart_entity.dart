import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final List<CartItemsEntity> items;

  final CartPricesEntity cartPrices;

  const CartEntity({
    required this.items,
    required this.cartPrices,
  });

  @override
  List<Object> get props => [items, cartPrices];
}

class CartItemsEntity extends Equatable {
  final int id;

  final int productId;
  final int quantity;

  final String name;
  final String description;
  final String image;
  final String price;

  const CartItemsEntity({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  @override
  List<Object> get props => [
        id,
        productId,
        quantity,
        name,
        description,
        image,
        price,
      ];
}

class CartPricesEntity extends Equatable {
  final int? totalDiscount;
  final int? subtotal;
  final int? total;

  const CartPricesEntity({
    required this.subtotal,
    required this.totalDiscount,
    required this.total,
  });

  @override
  List<Object?> get props => [totalDiscount, subtotal, total];
}



