import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int currentPage;

  final int total;

  final List<ProductData> data;

  const ProductEntity({
    required this.currentPage,
    required this.total,
    required this.data,
  });

  @override
  List<Object> get props => [currentPage, total, data];
}

class ProductData extends Equatable {
  final int id;

  final String image;

  final String name;
  final String price;
  final String address;

  const ProductData({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.address,
  });

  @override
  List<Object> get props => [id, image, name];
}
