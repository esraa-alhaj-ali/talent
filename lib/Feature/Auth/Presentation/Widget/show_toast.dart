import 'package:flutter/material.dart';

SnackBar ShowToast(
        {BuildContext? context,
        required String? text,
        required ToastStates state,
        int duration = 5}) =>
    SnackBar(
      content: Text(text!),
      duration: Duration(seconds: duration),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
        backgroundColor: ChooseColor(state),
      ),
    );

// ignore: constant_identifier_names
enum ToastStates { Succes, Error, Warning }

// ignore: non_constant_identifier_names
Color ChooseColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.Succes:
      color = Colors.green;
      break;
    case ToastStates.Warning:
      color = Colors.yellow;
      break;
    case ToastStates.Error:
      color = Colors.red;
      break;
  }
  return color;
}
