import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.items,
    required super.cartPrices,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: List<CartItemsModel>.from(
          (json['cart_items']).map((e) => CartItemsModel.fromJson(e))),
      cartPrices: CartPricesModel.fromJson(json['cart_prices']),
    );
  }
}

class CartItemsModel extends CartItemsEntity {
  const CartItemsModel({
    required super.id,
    required super.productId,
    required super.quantity,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
  });

  factory CartItemsModel.fromJson(Map<String, dynamic> json) {
    return CartItemsModel(
      image: json['image'],
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'],
      productId: json['product_id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class CartPricesModel extends CartPricesEntity {
  const CartPricesModel({
    required super.subtotal,
    required super.totalDiscount,
    required super.total,
  });

  factory CartPricesModel.fromJson(Map<String, dynamic> json) {
    return CartPricesModel(
      subtotal: json['subtotal'],
      total: json['total'],
      totalDiscount: json['total_discount'],
    );
  }
}


