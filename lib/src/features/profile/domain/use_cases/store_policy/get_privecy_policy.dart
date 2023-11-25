import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetPrivacyPolicyUseCase extends BaseUseCase<String, NoParameters> {
  final BaseProfileRepository profileRepository;

  GetPrivacyPolicyUseCase(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(NoParameters parameters) async {
    return await profileRepository.getPrivacyPolicy();
  }
}
