import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetCartItemsUseCase
    extends BaseUseCase<CartEntity, NoParameters> {
  final BaseCartRepository cartRepository;

  GetCartItemsUseCase(this.cartRepository);

  @override
  Future<Either<Failure, CartEntity>> call(NoParameters parameters) async {
    return await cartRepository.getCartItems();
  }
}
