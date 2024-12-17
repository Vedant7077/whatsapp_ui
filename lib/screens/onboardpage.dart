import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/loginpage.dart';
import 'package:whatsapp_ui/widgets/whatsappButton.dart';

class Onboardpage extends StatelessWidget {
  const Onboardpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/boarding.png"),
          SizedBox(height: 30,),
          Text("Welcome to WhatsApp",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
          ),
          const SizedBox(height:10 ,),
          RichText(text: const TextSpan(
            text: "Read out ",style: TextStyle(color: Colors.black,fontSize: 14),
            children: <InlineSpan>[
              TextSpan(text: "Privacy Policy. ",style: TextStyle(color: Color(0XFF0C42CC),fontSize: 14)),
              TextSpan(text: "Tap “Agree and continue”")
            ],
          ),
          ),
          const SizedBox(height: 5,),
          RichText(text: const TextSpan(
            text: "to accept the ",style: TextStyle(color: Colors.black,fontSize: 14),
            children: <InlineSpan>[
              TextSpan(text: "Teams of Service.",style: TextStyle(
                color: Color(0XFF0C42CC),
                fontSize: 14
              )),
            ]
          ))
        ],
      )),
      floatingActionButton: 
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
        },
        child: whatsappButton("Agree and continue")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


