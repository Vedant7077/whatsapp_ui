import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/providers/country_provider.dart';
import 'package:whatsapp_ui/screens/homescreen.dart';
import 'package:whatsapp_ui/widgets/custom_text.dart';
import 'package:whatsapp_ui/widgets/whatsappButton.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {

  Provider imageprovider = Provider(create: (context) => CountryProvider(),);
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            commonText("Profile info", 22, const Color(0XFF00A884), FontWeight.w700),
            const SizedBox(height: 30,),
            commonText("Please provide your name and an optional", 16, const Color(0XFF5E5E5E), FontWeight.w400),
            commonText("profile photo", 16, const Color(0XFF5E5E5E), FontWeight.w400),
            const SizedBox(height:20,),
            GestureDetector(
              onTap: (){
                _openBottom(context);
              },
              child: context.watch<CountryProvider>().getImage()==null?CircleAvatar(
                backgroundColor: const Color(0XFFD9D9D9),
                radius: 70,
                child: Image.asset("assets/images/photo-camera 1.png",fit: BoxFit.cover,height: 40,),
              ):CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(context.watch<CountryProvider>().getImage()!),
              )
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Enter your Name here",
                      hintStyle: TextStyle(color: Color(0XFF5E5E5E)),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF05A882)
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF05A882)
                        )
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF05A882)
                        )
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Image.asset("assets/images/happy-face 1.png",)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
        },
        child: whatsappButton("Next"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  _openBottom(BuildContext context){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  _pickImage(ImageSource.camera);
                }, icon: const Icon(Icons.camera_alt),iconSize: 80,),
                IconButton(onPressed: (){
                  _pickImage(ImageSource.gallery);
                }, icon: const Icon(Icons.image),iconSize: 80,)
              ],
            )
          ],
        ),
      );
    });
  }

  _pickImage(ImageSource imagesource)async{
    try{
      final photo = await ImagePicker().pickImage(source: imagesource);
      if (photo == null){
        return ;
      }
      final tempImage = File(photo.path);
      context.read<CountryProvider>().updateImage(tempImage);
      
    }
    catch(ex){
      print(ex.toString());
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.toString())
      ,backgroundColor: const Color(0XFF05A882),));
    }
  }
}