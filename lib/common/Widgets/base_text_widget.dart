import 'package:flutter/material.dart';

import '../values/colors.dart';

Widget reuseableSubTitleText(
    {required String text,
    Color color = AppColors.primaryText,
    double size = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
  );
}
