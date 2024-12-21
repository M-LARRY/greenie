import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(
    content: Text(
      message,
    ),
    duration: const Duration(seconds: 4, milliseconds: 300),
    backgroundColor: Colors.grey[900],
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
