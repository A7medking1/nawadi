import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_details_entity.dart';
import 'package:alnawadi/src/features/order/domain/repository/repository.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetOrderByIdUseCase extends BaseUseCase<OrderDetailsEntity, int> {
  final BaseOrderRepository orderRepository;

  GetOrderByIdUseCase(this.orderRepository);

  @override
  Future<Either<Failure, OrderDetailsEntity>> call(int orderId) async {
    return await orderRepository.getOrderById(orderId);
  }
}
