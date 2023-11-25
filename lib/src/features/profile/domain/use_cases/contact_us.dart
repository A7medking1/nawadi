import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/data/models/contact_us_model.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ContactUsUseCase extends BaseUseCase<void, ContactUsModel> {
  final BaseProfileRepository profileRepository;

  ContactUsUseCase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(ContactUsModel parameters) async {
    return await profileRepository.contactUs(parameters);
  }
}
