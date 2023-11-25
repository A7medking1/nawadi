import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/cart/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddProductToCartUseCase
    extends BaseUseCase<void, AddProductToCartParameters> {
  final BaseCartRepository cartRepository;

  AddProductToCartUseCase(this.cartRepository);

  @override
  Future<Either<Failure, void>> call(
      AddProductToCartParameters parameters) async {
    return await cartRepository.addProductToCart(parameters);
  }
}

class AddProductToCartParameters extends Equatable {
  final int productId;

  final int quantity;

  const AddProductToCartParameters({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object> get props => [productId, quantity];
}
