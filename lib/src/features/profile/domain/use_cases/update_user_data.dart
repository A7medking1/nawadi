import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/data/models/update_user_data.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserDataUseCase extends BaseUseCase<void, UpdateUserDataModel> {
  final BaseProfileRepository profileRepository;

  UpdateUserDataUseCase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(UpdateUserDataModel parameters) async {
    return await profileRepository.updateUserData(parameters);
  }
}
