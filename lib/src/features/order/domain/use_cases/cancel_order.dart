import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/order/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class CancelOrderUseCase extends BaseUseCase<void, int> {
  final BaseOrderRepository orderRepository;

  CancelOrderUseCase(this.orderRepository);

  @override
  Future<Either<Failure, void>> call(int parameters) async {
    return await orderRepository.cancelOrder(parameters);
  }
}
