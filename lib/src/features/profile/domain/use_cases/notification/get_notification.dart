import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetNotificationUseCase extends BaseUseCase<NotificationModel, NoParameters> {
  final BaseProfileRepository profileRepository;

  GetNotificationUseCase(this.profileRepository);

  @override
  Future<Either<Failure, NotificationModel>> call(NoParameters parameters) async {
    return await profileRepository.getNotifications();
  }
}
