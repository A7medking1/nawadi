import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String msg,
  required ToastStates state,
  int timeInSec = 3,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: timeInSec,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  return switch (state) {
    ToastStates.SUCCESS => Colors.green,
    ToastStates.WARNING => Colors.amber,
    ToastStates.ERROR => Colors.red,
  };
}
