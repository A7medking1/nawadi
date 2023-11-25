import 'package:alnawadi/src/features/products/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.currentPage,
    required super.total,
    required super.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      currentPage: json['current_page'],
      total: json['total'],
      data: List<ProductDataModel>.from(
          json['data'].map((e) => ProductDataModel.fromJson(e))),
    );
  }
}

class ProductDataModel extends ProductData {
  const ProductDataModel({
    required super.id,
    required super.image,
    required super.name,
    required super.price,
    required super.address,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      address: json['address'] ??'',
    );
  }
}
