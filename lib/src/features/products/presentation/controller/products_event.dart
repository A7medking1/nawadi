part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductEvent extends ProductsEvent {}

class GetProductCategoriesEvent extends ProductsEvent {}

class GetProductByCatEvent extends ProductsEvent {
  final int catId;

  const GetProductByCatEvent(this.catId);

  @override
  List<Object> get props => [catId];
}

class UpdateCatProductSelectedEvent extends ProductsEvent {
  final int id;
  final String name;

  const UpdateCatProductSelectedEvent({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}

class GetMoreProductEvent extends ProductsEvent {
  const GetMoreProductEvent();
}
