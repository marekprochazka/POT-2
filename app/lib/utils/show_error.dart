
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showError(BuildContext context, String message) {
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(message),
  //     backgroundColor: Colors.red,
  //   ),
  // );
  Flushbar(
    backgroundColor: Colors.red,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}