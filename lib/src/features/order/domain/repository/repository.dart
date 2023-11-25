
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/order/data/models/create_order_model.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_details_entity.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseOrderRepository {


  Future<Either<Failure,void>> createOrder(CreateOrderModel model);


  Future<Either<Failure,void>> cancelOrder(int orderId);


  Future<Either<Failure, List<OrderEntity>>> getUserOrder();

  Future<Either<Failure, OrderDetailsEntity>> getOrderById(int orderId);
}
