import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class MarlAllAsReadNotificationUseCase extends BaseUseCase<void, NoParameters> {
  final BaseProfileRepository profileRepository;

  MarlAllAsReadNotificationUseCase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await profileRepository.markAllNotificationAsRead();
  }
}
