part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();
}

class GetAddressEvent extends AddressEvent {
  @override
  List<Object> get props => [];
}

class DeleteAddressEvent extends AddressEvent {
  final int addressId;

  const DeleteAddressEvent({required this.addressId});

  @override
  List<Object> get props => [addressId];
}

class AddAddressEvent extends AddressEvent {
  final AddressEntity addressEntity;
  final BuildContext context;

  const AddAddressEvent(this.context, {required this.addressEntity});

  @override
  List<Object> get props => [addressEntity];
}

class UpdateAddressEvent extends AddressEvent {
  final AddressEntity addressEntity;

  const UpdateAddressEvent({required this.addressEntity});

  @override
  List<Object> get props => [addressEntity];
}

class GetAddressFromPrefs extends AddressEvent {
  @override
  List<Object> get props => [];
}
