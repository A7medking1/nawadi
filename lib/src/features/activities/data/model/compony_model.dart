import 'package:alnawadi/src/features/activities/domain/entity/company_entity.dart';

class CompaniesModel extends CompaniesEntity {
  const CompaniesModel({
    required super.currentPage,
    required super.total,
    required super.data,
  });

  factory CompaniesModel.fromJson(Map<String, dynamic> json) {
    return CompaniesModel(
      currentPage: json['current_page'],
      total: json['total'],
      data: List<CompaniesDataModel>.from(
          json['data'].map((e) => CompaniesDataModel.fromJson(e))),
    );
  }
}

class CompaniesDataModel extends CompaniesData {
  const CompaniesDataModel({
    required super.id,
    required super.image,
    required super.name,
  });

  factory CompaniesDataModel.fromJson(Map<String, dynamic> json) {
    return CompaniesDataModel(
      id: json['id'],
      image: json['logo'],
      name: json['company_name'],
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
