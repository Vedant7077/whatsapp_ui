import 'package:flutter/material.dart';

Widget commonText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      height: 1.5,
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
    ),
  );
}