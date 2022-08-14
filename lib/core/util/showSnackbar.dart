import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String? text) {
  if (text == null) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
