import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/views/api.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var store = GetStorage();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    emailController.text = store.read("email")??"";
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest Registration Portal'),
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
                  Text('Email', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
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
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              MaterialButton(
                onPressed: () async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    var response = await http.get(
      Uri.parse("$baseUrl/login.php?email=${emailController.text}&password=${passwordController.text}"),
    );

    var responseBody = jsonDecode(response.body);

    if (responseBody['success'] == 1) {
      store.write("email", emailController.text);
      Get.toNamed('/dashboard');
    } else {
      Get.snackbar("Error", "Invalid email or password");
    }
  },
  color: Colors.orangeAccent,
  minWidth: 200,
  child: Text('Login', style: TextStyle(color: Colors.white)),
),


              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      'Dont have an account? Register',
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                    onTap: () {
                      Get.toNamed('/adminsignup');
                    },
                  ),

                  Spacer(),

                  GestureDetector(
                    child: Text(
                      'Forgot Password? Reset',
                      style: TextStyle(color:Colors.orangeAccent),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}