import 'package:alnawadi/src/core/error/exceptions.dart';
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/profile/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/profile/data/models/chnage_password.dart';
import 'package:alnawadi/src/features/profile/data/models/contact_us_model.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/data/models/settings_model.dart';
import 'package:alnawadi/src/features/profile/data/models/update_user_data.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileRemoteDataSource remoteDataSource;

  ProfileRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final result = await remoteDataSource.getUserData();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final result = await remoteDataSource.logOut();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  /// address

  @override
  Future<Either<Failure, void>> addAddress(AddressEntity addressEntity) async {
    try {
      final result = await remoteDataSource.addAddress(addressEntity);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(int addressId) async {
    try {
      final result = await remoteDataSource.deleteAddress(addressId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getUserAddress() async {
    try {
      final result = await remoteDataSource.getUserAddress();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> updateAddress(
      AddressEntity addressEntity) async {
    try {
      final result = await remoteDataSource.updateAddress(addressEntity);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(ChangePassModel model) async {
    try {
      final result = await remoteDataSource.changePassword(model);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserData(
      UpdateUserDataModel model) async {
    try {
      final result = await remoteDataSource.updateUserData(model);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> contactUs(ContactUsModel contactUsModel) async {
    try {
      final result = await remoteDataSource.contactUs(contactUsModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getAboutUsPage() async {
    try {
      final result = await remoteDataSource.getAboutUsPage();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getPolicyPage() async {
    try {
      final result = await remoteDataSource.getPolicyPage();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getPrivacyPolicy() async {
    try {
      final result = await remoteDataSource.getPrivacyPolicy();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SettingsModel>> getSettings() async {
    try {
      final result = await remoteDataSource.getSettings();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getStorePolicy() async {
    try {
      final result = await remoteDataSource.getStorePolicy();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getTermsPage() async {
    try {
      final result = await remoteDataSource.getTermsPage();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, int>> getCountUnreadNotification() async {
    try {
      final result = await remoteDataSource.getCountUnreadNotification();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, NotificationModel>> getNotifications() async {
    try {
      final result = await remoteDataSource.getNotifications();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> markAllNotificationAsRead() async {
    try {
      final result = await remoteDataSource.markAllNotificationAsRead();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
