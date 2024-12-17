import 'package:flutter/material.dart';

Widget customContainer(TextEditingController controller){
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color(0XFFD9D9D9)
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none
        ),
      ),
    ),
  );
}