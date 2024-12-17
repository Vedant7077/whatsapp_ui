import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/providers/country_provider.dart';
import 'package:whatsapp_ui/screens/splash_screen.dart';

void main() => runApp(
  
   MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>CountryProvider())
    ],
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF00A884)),
        useMaterial3: false,
        fontFamily: "Regular"
      ),
      
      home: const SplashScreen() ,
    );
  }
}
