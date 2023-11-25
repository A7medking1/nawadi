import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ApplyCouponUseCase extends BaseUseCase<CartPricesEntity, String> {
  final BaseCartRepository cartRepository;

  ApplyCouponUseCase(this.cartRepository);

  @override
  Future<Either<Failure, CartPricesEntity>> call(String parameters) async {
    return await cartRepository.applyCoupons(parameters);
  }
}
