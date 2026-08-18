import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

              MaterialButton(
                onPressed: () {
                  Get.toNamed('/dashboard');
                },
                color: Colors.orangeAccent,
                minWidth: 200,
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),

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