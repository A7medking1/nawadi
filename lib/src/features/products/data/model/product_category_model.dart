import 'package:alnawadi/src/features/products/domain/entity/product_category_entity.dart';

class ProductCategoryModel extends ProductCategoryEntity {
  const ProductCategoryModel({
    required super.currentPage,
    required super.total,
    required super.data,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      currentPage: json['current_page'],
      total: json['total'],
      data: List<ProductCategoryDataModel>.from(
          json['data'].map((e) => ProductCategoryDataModel.fromJson(e))),
    );
  }
}

class ProductCategoryDataModel extends ProductCategoryData {
  const ProductCategoryDataModel({
    required super.id,
    required super.image,
    required super.name,
  });

  factory ProductCategoryDataModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryDataModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }
}
