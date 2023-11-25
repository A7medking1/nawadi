class NotificationModel {
  final int statusCode;
  final String message;
  final List<NotificationData> notifications;

  NotificationModel({
    required this.statusCode,
    required this.message,
    required this.notifications,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      statusCode: json["status_code"],
      message: json["message"],
      notifications: List.from(
        (json['notifications']).map(
          (e) => NotificationData.fromJson(e),
        ),
      ),
    );
  }
//
}

class NotificationData {
  final String id;
  final String type;
  final String notifiableType;
  final int notifiableId;
  final Data data;
  final String readAt;
  final String createdAt;
  final String updatedAt;

  NotificationData({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json["id"] ,
      type: json["type"],
      notifiableType: json["notifiable_type"],
      notifiableId: json["notifiable_id"],
      data: Data.fromJson(json['data']),
      readAt: json["read_at"] ?? '',
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}

class Data {
  final String message;
  final String title;
  final int userId;
  final String userName;

  Data({
    required this.message,
    required this.title,
    required this.userId,
    required this.userName,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json["message"],
      title: json["title"],
      userId: json["user_id"],
      userName: json["user_name"],
    );
  }
}
