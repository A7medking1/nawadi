import 'package:alnawadi/src/features/home/domain/entity/banners.dart';

class BannerModel extends BannersEntity {
  const BannerModel({
    required super.name,
    required super.image,
    required super.arrange,
    required super.status,
    required super.id,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      name: json['name'],
      image: json['image'],
      arrange: json['arrange'],
      status: json['status'],
      id: json['id'],
    );
  }
}
