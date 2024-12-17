import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/providers/country_provider.dart';
import 'package:whatsapp_ui/screens/otpscreen.dart';
import 'package:whatsapp_ui/widgets/custom_text.dart';
import 'package:whatsapp_ui/widgets/whatsappButton.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Center(
            child: Text(
              "Enter your phone number",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF00A884)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          commonText("WhatsApp will need to verify your phone", 16,
              Colors.black, FontWeight.w400),
          commonText("number. Carrier charges may apply.", 16, Colors.black,
              FontWeight.w400),
          commonText(" What’s my number?", 16, const Color(0XFF00A884),
              FontWeight.w400),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Consumer<CountryProvider>(
              builder: (ctx, provider, __) => DropdownButtonFormField(
                items: provider.getCountryList().map((String country) {
                  return DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (val) {
                  provider.changeCountry(val!);
                },
                value: provider.getCountry(),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884))),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 50,
                  child: TextField(
                    controller: countryCodeController,
                    decoration: const InputDecoration(
                        hintText: "+91",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF00A884)))),
                  )),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 256,
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)))),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: InkWell(
          onTap: () {
            login(phoneController.text,countryCodeController.text);
          },
          child: whatsappButton("Next")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  login(String phonenumber,String countrycode) {
    if (phonenumber == "") {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Phone number"),
        backgroundColor: Color(0XFF00A884),
      ));
    } 
    else if(countrycode == ""){
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Country code"),
        backgroundColor: Color(0XFF00A884),
      ));
    }
    else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Otpscreen(
                    phonenumber: phonenumber,
                    countryCode: countrycode,
                  )));
    }
  }
}
