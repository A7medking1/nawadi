import 'dart:async';

import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/form_field_widget.dart';
import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/add_address.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/delete_address.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/get_user_address.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/update_address.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'address_event.dart';

part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc(
    this.getAddressUseCase,
    this.updateAddressUseCase,
    this.deleteAddressUseCase,
    this.addAddressUseCase,
  ) : super(const AddressState()) {
    on<GetAddressEvent>(_getAddress);
    on<UpdateAddressEvent>(_updateAddress);
    on<DeleteAddressEvent>(_deleteAddress);
    on<AddAddressEvent>(_addAddress);
    on<GetAddressFromPrefs>(_getCurrentAddress);
  }

  final GetAddressUseCase getAddressUseCase;

  final UpdateAddressUseCase updateAddressUseCase;

  final DeleteAddressUseCase deleteAddressUseCase;

  final AddAddressUseCase addAddressUseCase;

  FutureOr<void> _getAddress(
      GetAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(getAddressReqState: ReqState.loading));

    final result = await getAddressUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          getAddressReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              address: r,
              getAddressReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              address: r,
              getAddressReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _updateAddress(
      UpdateAddressEvent event, Emitter<AddressState> emit) async {}

  FutureOr<void> _deleteAddress(
      DeleteAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(deleteReqState: ReqState.loading));

    final result = await deleteAddressUseCase(event.addressId);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          deleteReqState: ReqState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            deleteReqState: ReqState.success,
          ),
        );
        add(GetAddressEvent());
      },
    );
  }

  FutureOr<void> _addAddress(
      AddAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(addReqState: ReqState.loading));

    final result = await addAddressUseCase(event.addressEntity);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          addReqState: ReqState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            addReqState: ReqState.success,
          ),
        );
        showToast(msg: 'success', state: ToastStates.SUCCESS);
        add(GetAddressEvent());
        event.context.pop();
      },
    );
  }

  FutureOr<void> _getCurrentAddress(
      GetAddressFromPrefs event, Emitter<AddressState> emit) {
    emit(state.copyWith(addressReqState: ReqState.loading));
    final prefs = sl<AppPreferences>().getLocation();
    emit(state.copyWith(
        currentAddress: prefs, addressReqState: ReqState.success));
  }
}
