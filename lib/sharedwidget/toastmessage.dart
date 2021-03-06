import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Color(0xff4d3a58),
      textColor: Colors.white, //message text color
      fontSize: 16.0 //message font size
      );
}
