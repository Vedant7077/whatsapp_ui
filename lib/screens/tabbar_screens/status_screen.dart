import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/constants/constants.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Status",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg"),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0XFF008069),
                    child: Center(
                        child: Icon(
                      Icons.add,
                      size: 15,
                      color: Color(0XFFFFFFFF),
                    )),
                  ))
            ],
          ),
          title: Text("My Status",style: TextStyle(fontSize: 20),),
          subtitle: Text("Tap to add status update",style: TextStyle(fontSize: 15),),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Recent updates"),
            Icon(Icons.arrow_drop_down) 
          ],),
        ),
        const SizedBox(height: 10,),
        Expanded(child: ListView.builder(
          itemCount: statusContent.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(statusContent[index]['img'].toString()),
              ),
              title: Text(statusContent[index]['name'].toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              subtitle: Text(statusContent[index]['statustime'].toString(),style:  const TextStyle(fontSize: 14),),
            );
          },
          ))
      ],
    ));
  }
}
