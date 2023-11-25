import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_entity.dart';
import 'package:alnawadi/src/features/order/domain/repository/repository.dart';
import 'package:alnawadi/src/features/profile/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetUserOrderUseCase extends BaseUseCase<List<OrderEntity>, NoParameters> {
  final BaseOrderRepository orderRepository;

  GetUserOrderUseCase(this.orderRepository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(
      NoParameters parameters) async {
    return await orderRepository.getUserOrder();
  }
}
