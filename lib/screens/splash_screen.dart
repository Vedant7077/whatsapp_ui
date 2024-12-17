import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/onboardpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboardpage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/whatsapp 1.png"),
            const SizedBox(height: 20,),
            const Text("WhatsApp",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}