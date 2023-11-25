import 'package:equatable/equatable.dart';

class ProductCategoryEntity extends Equatable {
  final int currentPage;

  final int total;

  final List<ProductCategoryData> data;

  const ProductCategoryEntity({
    required this.currentPage,
    required this.total,
    required this.data,
  });

  @override
  List<Object> get props => [currentPage, total, data];
}

class ProductCategoryData extends Equatable {
  final int id;

  final String image;

  final String name;

  const ProductCategoryData({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  List<Object> get props => [id, image, name];
}
