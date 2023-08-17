import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.black,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(50),
    elevation: 15,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
