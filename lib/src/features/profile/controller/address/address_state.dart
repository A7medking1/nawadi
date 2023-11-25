part of 'address_bloc.dart';

class AddressState extends Equatable {
  final ReqState? addReqState;

  final ReqState? deleteReqState;

  final ReqState? updateReqState;

  final ReqState getAddressReqState;
  final ReqState addressReqState;

  final List<AddressEntity> address;

  final String message;

  final AddressEntity? currentAddress;

  const AddressState({
    this.addReqState,
    this.deleteReqState,
    this.updateReqState,
    this.getAddressReqState = ReqState.loading,
    this.address = const [],
    this.message = '',
    this.currentAddress,
    this.addressReqState = ReqState.loading,
  });

  AddressState copyWith({
    ReqState? addReqState,
    ReqState? deleteReqState,
    ReqState? updateReqState,
    ReqState? getAddressReqState,
    ReqState? addressReqState,
    List<AddressEntity>? address,
    String? message,
    AddressEntity? currentAddress,
  }) {
    return AddressState(
      addReqState: addReqState ?? this.addReqState,
      deleteReqState: deleteReqState ?? this.deleteReqState,
      getAddressReqState: getAddressReqState ?? this.getAddressReqState,
      updateReqState: updateReqState ?? this.updateReqState,
      addressReqState: addressReqState ?? this.addressReqState,
      address: address ?? this.address,
      message: message ?? this.message,
      currentAddress: currentAddress ?? this.currentAddress,
    );
  }

  @override
  List<Object?> get props => [
        addReqState,
        deleteReqState,
        updateReqState,
        getAddressReqState,
        address,
        message,
        currentAddress,
        addressReqState
      ];
}
