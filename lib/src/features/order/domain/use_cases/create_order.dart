import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/order/data/models/create_order_model.dart';
import 'package:alnawadi/src/features/order/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class CreateOrderUseCase extends BaseUseCase<void, CreateOrderModel> {
  final BaseOrderRepository orderRepository;

  CreateOrderUseCase(this.orderRepository);

  @override
  Future<Either<Failure, void>> call(CreateOrderModel parameters) async {
    return await orderRepository.createOrder(parameters);
  }
}
