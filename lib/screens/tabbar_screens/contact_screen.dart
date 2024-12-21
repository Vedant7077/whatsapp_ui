import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/constants/constants.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: contactContent.length,
        itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(contactContent[index]["img"].toString()),
          ),
          title: Text(contactContent[index]['name'].toString(),style: const TextStyle(fontSize: 18),),
          subtitle: Text(contactContent[index]['status'].toString(),style: const TextStyle(fontSize: 16),),
        );
      },)
    );
  }
}