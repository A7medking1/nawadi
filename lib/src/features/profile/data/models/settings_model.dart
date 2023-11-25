import 'package:equatable/equatable.dart';

class SettingsModel extends Equatable {
  final int id;
  final String companyName;
  final String email;
  final String websiteLink;
  final String companyPhone;
  final String companyAddress;
  final String twitter;
  final String facebook;
  final String google;
  final String linkedin;
  final String github;
  final String biographicalInformation;
  final String logo;
  final int isadmin;
  final String backgroundImage;
  final int status;
  final int arrange;
  final int userId;
  final String createdAt;
  final String updatedAt;

  const SettingsModel(
      {required this.id,
      required this.companyName,
      required this.email,
      required this.websiteLink,
      required this.companyPhone,
      required this.companyAddress,
      required this.twitter,
      required this.facebook,
      required this.google,
      required this.linkedin,
      required this.github,
      required this.biographicalInformation,
      required this.logo,
      required this.isadmin,
      required this.backgroundImage,
      required this.status,
      required this.arrange,
      required this.userId,
      required this.createdAt,
      required this.updatedAt});

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      id: int.parse(json["id"]),
      companyName: json["company_name"],
      email: json["email"],
      websiteLink: json["website_link"],
      companyPhone: json["company_phone"],
      companyAddress: json["company_address"],
      twitter: json["twitter"],
      facebook: json["facebook"],
      google: json["google"],
      linkedin: json["linkedin"],
      github: json["github"],
      biographicalInformation: json["biographical_information"],
      logo: json["logo"],
      isadmin: int.parse(json["isadmin"]),
      backgroundImage: json["background_image"],
      status: int.parse(json["status"]),
      arrange: int.parse(json["arrange"]),
      userId: int.parse(json["user_id"]),
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  @override
  List<Object> get props => [
        id,
        companyName,
        email,
        websiteLink,
        companyPhone,
        companyAddress,
        twitter,
        facebook,
        google,
        linkedin,
        github,
        biographicalInformation,
        logo,
        isadmin,
        backgroundImage,
        status,
        arrange,
        userId,
        createdAt,
        updatedAt,
      ];
}
