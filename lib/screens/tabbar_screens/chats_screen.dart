import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/tabbar_screens/contact_screen.dart';
import 'package:whatsapp_ui/utils/constants/constants.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(persons[index]['images'].toString()),
                  ),
                  title: Text(persons[index]['name'].toString()),
                  subtitle: Text(persons[index]['lastmsg'].toString()),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(persons[index]['time'].toString()),
                    const SizedBox(height: 5,),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Color(0XFF036A01),
                      child: Text(persons[index]['msg'].toString(),
                      style: const TextStyle(fontSize: 12,color: Color(0XFFFFFFFF)),),
                    )
                  ],),
                );
            }),
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactScreen()));
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color(0XFF008665),
          child: Image.asset("assets/images/chatcontact.png"),
        ),
      ),
    );
  }
}