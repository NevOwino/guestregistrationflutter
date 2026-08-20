import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/views/api.dart';

TextEditingController adminNameController = TextEditingController();
TextEditingController adminEmailController = TextEditingController();
TextEditingController adminPasswordController = TextEditingController();
TextEditingController adminConfirmPasswordController = TextEditingController();

class AdminSignup extends StatelessWidget {
  const AdminSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Signup'),
        backgroundColor: Colors.orangeAccent,
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
                  Image.asset('assets/guestlogo.jpg', height: 200, width: 400),
                ],
              ),

              SizedBox(height: 20),

              Row(children: [Text('Full Name', style: TextStyle(color: Colors.deepOrange))]),
              TextField(
                controller: adminNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(children: [Text('Email', style: TextStyle(color: Colors.deepOrange))]),
              TextField(
                controller: adminEmailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(children: [Text('Password', style: TextStyle(color: Colors.deepOrange))]),
              TextField(
                obscureText: true,
                controller: adminPasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(children: [Text('Confirm Password', style: TextStyle(color: Colors.deepOrange))]),
              TextField(
                obscureText: true,
                controller: adminConfirmPasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              MaterialButton(onPressed: () async {
  if (adminNameController.text.isEmpty ||
      adminEmailController.text.isEmpty ||
      adminPasswordController.text.isEmpty ||
      adminConfirmPasswordController.text.isEmpty) {
    Get.snackbar("Error", "Please fill in all fields");
    return;
  }
  if (adminPasswordController.text != adminConfirmPasswordController.text) {
    Get.snackbar("Error", "Passwords do not match");
    return;
  }

  var response = await http.post(
    Uri.parse("$baseUrl/admin-signup.php"),
    body: {
      "name": adminNameController.text,
      "email": adminEmailController.text,
      "password": adminPasswordController.text,
    },
  );

  var responseBody = jsonDecode(response.body);

  if (responseBody['success'] == 1) {
    Get.toNamed('/login');
  } else {
    Get.snackbar("Error", "Signup failed, please try again");
  }
  },),

              SizedBox(height: 20),

              GestureDetector(
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                onTap: () {
                  Get.toNamed('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}