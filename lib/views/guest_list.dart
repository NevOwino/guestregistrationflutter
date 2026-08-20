import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/views/api.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});
  @override
  State<GuestList> createState() => GuestListState();
}

class GuestListState extends State<GuestList> {
  List<Map<String, String>> guests = [];

  @override
  void initState() { super.initState(); fetchGuests(); }

  Future<void> fetchGuests() async {
    var response = await http.get(Uri.parse("$baseUrl/get-guests.php"));
    var body = jsonDecode(response.body);
    List<Map<String, String>> loaded = [];
    if (body['success'] == 1) {
      for (var row in body['data']) {
        loaded.add({'id': row['id'].toString(), 'name': row['full_name'].toString(), 'email': row['email'].toString(), 'phone': row['phone'].toString()});
      }
    }
    setState(() { guests = loaded; });
  }

  void deleteGuest(int index) { showDialog( context: context, builder: (context) { return AlertDialog( title: Text('Delete Guest'), content: Text('Remove ${guests[index]['name']} from the list?'), actions: [ TextButton( onPressed: () => Get.back(), child: Text('Cancel', style: TextStyle(color: Colors.grey)), ), TextButton( onPressed: () async { var response = await http.get(Uri.parse("$baseUrl/delete-guest.php?id=${guests[index]['id']}")); var body = jsonDecode(response.body); if (body['success'] == 1) { setState(() { guests.removeAt(index); }); } Get.back(); }, child: Text('Delete', style: TextStyle(color: Colors.red)), ), ], ); }, ); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guest List'), backgroundColor: Colors.orangeAccent, foregroundColor: Colors.white, centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: guests.asMap().entries.map((entry) { int index = entry.key; Map<String, String> guest = entry.value;
              return Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(border: Border.all(color: Colors.orangeAccent), borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [Icon(Icons.person, color: Colors.deepOrange), SizedBox(width: 10), Expanded(child: Text(guest['name']!, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange))), IconButton(icon: Icon(Icons.delete, color: Colors.red, size: 20), onPressed: () => deleteGuest(index))]),
                    SizedBox(height: 5),
                    Row(children: [Icon(Icons.email, size: 16, color: Colors.grey), SizedBox(width: 10), Text(guest['email']!)]),
                    SizedBox(height: 5),
                    Row(children: [Icon(Icons.phone, size: 16, color: Colors.grey), SizedBox(width: 10), Text(guest['phone']!)]),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}