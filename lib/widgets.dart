import 'package:book_app/Const.dart';
import 'package:flutter/material.dart';

customSnackBar(context, text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Constant.primarycolor,
    content: Text(text),
    duration: Duration(milliseconds: 300),
  ));
}
