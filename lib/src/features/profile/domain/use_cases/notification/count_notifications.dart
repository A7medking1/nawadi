import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetCountNotificationUseCase extends BaseUseCase<int, NoParameters> {
  final BaseProfileRepository profileRepository;

  GetCountNotificationUseCase(this.profileRepository);

  @override
  Future<Either<Failure, int>> call(NoParameters parameters) async {
    return await profileRepository.getCountUnreadNotification();
  }
}
