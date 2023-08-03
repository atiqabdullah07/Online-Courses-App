import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(
    {required String msg,
    Color bgColor = Colors.black,
    Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: bgColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      fontSize: 16.sp);
}
