import 'package:alnawadi/src/features/activities/domain/entity/subscriptions_activity_entity.dart';

class SubscribedActivitiesModel extends SubscribedActivitiesEntity {
  const SubscribedActivitiesModel({
    required super.currentPage,
    required super.total,
    required super.data,
  });

  factory SubscribedActivitiesModel.fromJson(Map<String, dynamic> json) {
    return SubscribedActivitiesModel(
      currentPage: json['current_page'],
      total: json['total'],
      data: List<SubScripActivityDataModel>.from(
          (json['data']).map((e) => SubScripActivityDataModel.fromJson(e))),
    );
  }
}

class SubScripActivityDataModel extends SubScripActivityDataEntity {
  const SubScripActivityDataModel({
    required super.id,
    required super.nameAr,
    required super.nameEn,
    required super.arrange,
    required super.status,
    required super.image,
    required super.price,
    required super.address,
    required super.startDate,
    required super.endDate,
    required super.fileType,
  });

  factory SubScripActivityDataModel.fromJson(Map<String, dynamic> json) {
    return SubScripActivityDataModel(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'] ?? '',
      arrange: json['arrange'],
      status: json['status'],
      image: json['image'],
      price: json['price'],
      address: json['adress'],
      startDate: json['start_data'],
      endDate: json['end_data'],
      fileType: json['file_type'],
    );
  }
}
