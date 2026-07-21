import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest Registration'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/daystarlogo.png', height: 200, width: 400),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Full name', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Email', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Phone number', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),


              Row(
                children: [
                  Text('Password', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              MaterialButton(
                onPressed: () {
                  Get.toNamed('/home');//change to navigate to thank you screen
                },
                color: Colors.blueAccent,
                minWidth: 200,
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}