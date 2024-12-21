import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/tabbar_screens/call_screen.dart';
import 'package:whatsapp_ui/screens/tabbar_screens/camera_screen.dart';
import 'package:whatsapp_ui/screens/tabbar_screens/chats_screen.dart';
import 'package:whatsapp_ui/screens/tabbar_screens/status_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: const Padding(
            padding:  EdgeInsets.only(left: 20),
            child:  Text(
              "WhatsApp",style: TextStyle(fontSize: 20),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/Search.png")),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_sharp))
          ],
          bottom: const TabBar(
            tabs:[
              Tab(icon: Icon(Icons.camera_alt),),
              Tab(text: "SEARCH"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],indicatorColor: Colors.white, ),
          ),
          body: const TabBarView(children: [
            CameraScreen(),
            ChatsScreen(),
            StatusScreen(),
            CallScreen()
          ]),
      ),
    );
  }
}