import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/constants/constants.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      const SizedBox(height: 30,),
      const Row(
        children: [
          SizedBox(width: 20,),
        Text("Recent",style: TextStyle(fontSize: 20),)
      ],),
      const SizedBox(height: 20,),
      Expanded(child: ListView.builder(
        itemCount: callContent.length,
        itemBuilder: (context,index){return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(callContent[index]['img'].toString()),
          ),
          title: Text(callContent[index]['name'].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
          subtitle: Text(callContent[index]['calltime'].toString(),style: const 
          TextStyle(fontSize: 16),),
          trailing: IconButton(icon:const Icon(Icons.call,color: Color(0XFF00A884),),onPressed: (){},),
        );}))
    ],));
  }
}