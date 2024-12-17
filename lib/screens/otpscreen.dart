import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/profilepage.dart';
import 'package:whatsapp_ui/widgets/custom_otp_container.dart';
import 'package:whatsapp_ui/widgets/custom_text.dart';
import 'package:whatsapp_ui/widgets/whatsappButton.dart';

class Otpscreen extends StatelessWidget {
  final String phonenumber;
  final String countryCode;
  Otpscreen({
    super.key,
    required this.phonenumber,
    required this.countryCode,
  });

  TextEditingController textEditingController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80,),
            commonText("Verifying your number", 22, Color(0XFF00A884), FontWeight.w700),
            const SizedBox(height:30),
            commonText("You’ve tried to register $countryCode$phonenumber", 
            16, 
            const Color(0XFF5E5E5E), 
            FontWeight.w400),
            commonText("recently. Wait before requesting an sms or a call.", 
            16, 
           const Color(0XFF5E5E5E), 
            FontWeight.w400),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              commonText("with your code.", 16, const Color(0XFF5E5E5E), FontWeight.w400),
              const SizedBox(width:5),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: commonText("Wrong number?", 16, Color(0XFF00A884), FontWeight.w400),
              )
            ],),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customContainer(textEditingController1),
                  customContainer(textEditingController1),
                  customContainer(textEditingController1),
                  customContainer(textEditingController1),
                  customContainer(textEditingController1),
                  customContainer(textEditingController1),
                ],
              ),
              ),
              const SizedBox(height: 50,),
              commonText("Didn’t receive code?", 16, Color(0XFF00A884), FontWeight.w400)
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profilepage()));
        },
        child: whatsappButton("Next")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
