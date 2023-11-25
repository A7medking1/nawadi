import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/cart/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RemoveProductFromCartUseCase extends BaseUseCase<void, int> {
  final BaseCartRepository cartRepository;

  RemoveProductFromCartUseCase(this.cartRepository);

  @override
  Future<Either<Failure, void>> call(int parameters) async {
    return await cartRepository.removeProductFromCart(parameters);
  }
}
