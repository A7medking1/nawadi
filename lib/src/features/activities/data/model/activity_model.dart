import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';

class ActivityModel extends ActivityEntity {
  const ActivityModel({
    required super.currentPage,
    required super.total,
    required super.data,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      currentPage: json['current_page'],
      total: json['total'],
      data: List<ActivityDataModel>.from(
          json['data'].map((e) => ActivityDataModel.fromJson(e))),
    );
  }
}

class ActivityDataModel extends ActivityData {
  const ActivityDataModel({
    required super.id,
    required super.image,
    required super.name,
    required super.price,
    required super.address,
    required super.fileType,
  });

  factory ActivityDataModel.fromJson(Map<String, dynamic> json) {
    return ActivityDataModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      address: json['adress'],
      fileType: json['file_type'],
    );
  }
}
