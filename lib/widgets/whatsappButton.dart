import 'package:flutter/material.dart';

Widget whatsappButton (String text){
  return Container(
    height: 45,
    width: 300,
    decoration: BoxDecoration(
      color: Color(0XFF00A884),
      borderRadius: BorderRadius.circular(40)),
    child: Center(
      child: Text(text,
      style: const TextStyle(color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,),
    ),
  );
}
