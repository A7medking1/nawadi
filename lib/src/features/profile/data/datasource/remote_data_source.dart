import 'package:alnawadi/src/features/profile/data/models/address.dart';
import 'package:alnawadi/src/features/profile/data/models/chnage_password.dart';
import 'package:alnawadi/src/features/profile/data/models/contact_us_model.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/data/models/settings_model.dart';
import 'package:alnawadi/src/features/profile/data/models/update_user_data.dart';
import 'package:alnawadi/src/features/profile/data/models/user_model.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';

abstract class BaseProfileRemoteDataSource {
  Future<UserModel> getUserData();

  Future<void> logOut();

  Future<void> changePassword(ChangePassModel model);

  Future<void> updateUserData(UpdateUserDataModel model);

  /// address

  Future<List<AddressModel>> getUserAddress();

  Future<void> addAddress(AddressEntity addressEntity);

  Future<void> updateAddress(AddressEntity addressEntity);

  Future<void> deleteAddress(int addressId);

  ///
  Future<void> contactUs(ContactUsModel model);

  /// store

  Future<String> getStorePolicy();

  Future<String> getPolicyPage();

  Future<String> getPrivacyPolicy();

  Future<String> getAboutUsPage();

  Future<String> getTermsPage();

  Future<SettingsModel> getSettings();

  /// notifications

  Future<NotificationModel> getNotifications();

  Future<int> getCountUnreadNotification();

  Future<void> markAllNotificationAsRead();
}
