import 'package:flutter/material.dart';

showSnakBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.blue,
    duration: Duration(seconds: 3),
    content: Text(text),
    action: SnackBarAction(label: "Close", onPressed: () {}),
  ));
}
