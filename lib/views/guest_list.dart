import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState()=> GuestListState();}
  class GuestListState extends State<GuestList>{
    List<Map<String, String>> guests = [{
      'name':'Jane Doe',
      'email':'jane@gmail.com',
      'phone':'0712345678',
      }];
  
    void deleteGuest(int index) { showDialog( context: context, builder: (context) { return AlertDialog( title: Text('Delete Guest'), content: Text('Remove ${guests[index]['name']} from the list?'), actions: [ TextButton( onPressed: () => Get.back(), child: Text('Cancel', style: TextStyle(color: Colors.grey)), ), TextButton( onPressed: () { setState(() { guests.removeAt(index); }); Get.back(); }, child: Text('Delete', style: TextStyle(color: Colors.red)), ), ], ); }, ); } 
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest List'),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
             children: guests.asMap().entries.map((entry) { int index = entry.key; Map<String, String> guest = entry.value; {
              return Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row( children: [ Icon(Icons.person, color: Colors.deepOrange), SizedBox(width: 10), Expanded( child: Text( guest['name']!, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange), ), ), IconButton( icon: Icon(Icons.delete, color: Colors.red, size: 20), onPressed: () => deleteGuest(index),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.email, size: 16, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(guest['email']!),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 16, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(guest['phone']!),
                      ],
                    ),
                  ],
                ),
              );
            }}).toList(),
          ),
        ),
      ),
    );
  }
}