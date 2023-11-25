import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/api/api_consumer.dart';
import 'package:alnawadi/src/features/profile/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/profile/data/models/address.dart';
import 'package:alnawadi/src/features/profile/data/models/chnage_password.dart';
import 'package:alnawadi/src/features/profile/data/models/contact_us_model.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/data/models/settings_model.dart';
import 'package:alnawadi/src/features/profile/data/models/update_user_data.dart';
import 'package:alnawadi/src/features/profile/data/models/user_model.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProfileRemoteDataSource(this.apiConsumer);

  @override
  Future<UserModel> getUserData() async {
    final Response response = await apiConsumer.get(
      ApiConstant.userProfile,
    );
    return UserModel.fromJson(response.data);
  }

  @override
  Future<void> logOut() async {
    await apiConsumer.post(
      ApiConstant.logout,
    );
  }

  /// address

  @override
  Future<void> addAddress(AddressEntity addressEntity) async {
    // final Response response =
    await apiConsumer.post(ApiConstant.addAddress, queryParameters: {
      'country': addressEntity.country,
      'city': addressEntity.city,
      'state': addressEntity.state,
      'name': addressEntity.name,
      'phone': addressEntity.phone,
      'email': addressEntity.email,
      'address_1': addressEntity.address_1,
    });
  }

  @override
  Future<void> deleteAddress(int addressId) async {
    //final Response response =
    await apiConsumer.delete(
      ApiConstant.deleteAddress(addressId),
    );
  }

  @override
  Future<List<AddressModel>> getUserAddress() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getUserAddress,
    );
    return List<AddressModel>.from(
        (response.data['userAddresses']).map((e) => AddressModel.fromJson(e)));
  }

  @override
  Future<void> updateAddress(AddressEntity addressEntity) async {
    // final Response response =
    await apiConsumer.put(ApiConstant.updateAddress, queryParameters: {
      'id': addressEntity.id,
      'country': addressEntity.country,
      'city': addressEntity.city,
      'state': addressEntity.state,
      'name': addressEntity.name,
      'phone': addressEntity.phone,
      'email': addressEntity.email,
      'address_1': addressEntity.address_1,
    });
  }

  @override
  Future<void> changePassword(ChangePassModel model) async {
    // final Response response =
    await apiConsumer.post(
      ApiConstant.changePassword,
      queryParameters: model.toJson(),
    );
  }

  @override
  Future<void> updateUserData(UpdateUserDataModel model) async {
    // final Response response =
    await apiConsumer.post(
      ApiConstant.updateUserInfo,
      queryParameters: model.toJson(),
    );
  }

  @override
  Future<void> contactUs(ContactUsModel model) async {
    //final Response response =
    await apiConsumer.post(
      ApiConstant.contactUs,
      queryParameters: model.toJson(),
    );
  }

  @override
  Future<String> getAboutUsPage() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getAboutUsPage,
    );
    return response.data['about_us']['about_us'];
  }

  @override
  Future<String> getPolicyPage() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getPolicyPage,
    );
    return response.data['return_policy']['return_policy'];
  }

  @override
  Future<String> getPrivacyPolicy() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getPrivacyPolicy,
    );
    return response.data['privacy']['privacy'];
  }

  @override
  Future<SettingsModel> getSettings() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getSettings,
    );
    return SettingsModel.fromJson(response.data['setting']);
  }

  @override
  Future<String> getStorePolicy() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getStorePolicy,
    );
    return response.data['store_policy']['store_policy'];
  }

  @override
  Future<String> getTermsPage() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getTermsPage,
    );
    return response.data['terms']['terms'];
  }

  @override
  Future<int> getCountUnreadNotification() async {
    final Response response = await apiConsumer.get(
      ApiConstant.notificationUnreadCount,
    );
    return response.data['countNotifications'];
  }

  @override
  Future<NotificationModel> getNotifications() async {
    final Response response = await apiConsumer.get(
      ApiConstant.notification,
    );
    return NotificationModel.fromJson(response.data);
  }

  @override
  Future<void> markAllNotificationAsRead() async {
    await apiConsumer.post(
      ApiConstant.notificationMarkAsRead,
    );
  }
}
