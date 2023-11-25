import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/cart/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ClearAllCartItemsUseCase extends BaseUseCase<void, NoParameters> {
  final BaseCartRepository cartRepository;

  ClearAllCartItemsUseCase(this.cartRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await cartRepository.clearAllCartItems();
  }
}
