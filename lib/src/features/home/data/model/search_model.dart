import 'package:alnawadi/src/features/home/domain/entity/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel({
    required super.id,
    required super.image,
    required super.price,
    required super.name,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json["id"],
      image: json["image"],
      price: json["price"],
      name: json["name"],
    );
  }
}
