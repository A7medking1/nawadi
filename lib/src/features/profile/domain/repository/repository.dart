import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/profile/data/models/chnage_password.dart';
import 'package:alnawadi/src/features/profile/data/models/contact_us_model.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/data/models/settings_model.dart';
import 'package:alnawadi/src/features/profile/data/models/update_user_data.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, UserEntity>> getUserData();

  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, void>> changePassword(ChangePassModel model);

  Future<Either<Failure, void>> updateUserData(UpdateUserDataModel model);

  /// address

  Future<Either<Failure, List<AddressEntity>>> getUserAddress();

  Future<Either<Failure, void>> addAddress(AddressEntity addressEntity);

  Future<Either<Failure, void>> updateAddress(AddressEntity addressEntity);

  Future<Either<Failure, void>> deleteAddress(int addressId);

  /// contact us

  Future<Either<Failure, void>> contactUs(ContactUsModel contactUsModel);

  /// store

  Future<Either<Failure, String>> getStorePolicy();

  Future<Either<Failure, String>> getPolicyPage();

  Future<Either<Failure, String>> getPrivacyPolicy();

  Future<Either<Failure, String>> getAboutUsPage();

  Future<Either<Failure, String>> getTermsPage();

  Future<Either<Failure, SettingsModel>> getSettings();

  /// notification

  Future<Either<Failure, NotificationModel>> getNotifications();

  Future<Either<Failure, int>> getCountUnreadNotification();

  Future<Either<Failure, void>> markAllNotificationAsRead();
}
