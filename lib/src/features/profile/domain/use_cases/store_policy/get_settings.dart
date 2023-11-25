import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/data/models/settings_model.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetSettingsUseCase extends BaseUseCase<SettingsModel, NoParameters> {
  final BaseProfileRepository profileRepository;

  GetSettingsUseCase(this.profileRepository);

  @override
  Future<Either<Failure, SettingsModel>> call(NoParameters parameters) async {
    return await profileRepository.getSettings();
  }
}
