import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController regNameController = TextEditingController(); TextEditingController regEmailController = TextEditingController(); TextEditingController regPhoneController = TextEditingController(); TextEditingController regIdController = TextEditingController(); TextEditingController regPasswordController = TextEditingController(); TextEditingController regConfirmPasswordController = TextEditingController();

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest Desk'),
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

              Row(
                children: [
                  Text('Full name', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                controller: regNameController,
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
                controller: regEmailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
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
                controller: regPhoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('National Id/ Passport Number', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                controller: regIdController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.badge),
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
                controller: regPasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

               Row(
                children: [
                  Text('Confirm Password', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                obscureText: true,
                controller: regConfirmPasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              MaterialButton( onPressed: () { if (regNameController.text.isEmpty || regEmailController.text.isEmpty || regPhoneController.text.isEmpty || regIdController.text.isEmpty || regPasswordController.text.isEmpty || regConfirmPasswordController.text.isEmpty) { Get.snackbar("Error", "Please fill in all fields"); return; } if (regPasswordController.text != regConfirmPasswordController.text) { Get.snackbar("Error", "Passwords do not match"); return; } Get.toNamed('/thankyou'); }
                ,color: Colors.orangeAccent,
                minWidth: 200,
                child: Text('Register', style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 20),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    GestureDetector(
      child: Text(
        'Admin Login',
        style: TextStyle(color: Colors.orangeAccent),
      ),
      onTap: () {
        Get.toNamed('/login');
      },
    ),
  ],
),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}