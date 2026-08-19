import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Complete'),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),

              Icon(Icons.check_circle, color: Colors.orangeAccent, size: 100),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thank You!',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Text(
                'Your registration was successful.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 16),
              ),

              SizedBox(height: 40),

              MaterialButton(
                onPressed: () {
                  Get.offAllNamed('/register');
                },
                color: Colors.orangeAccent,
                minWidth: 200,
                child: Text('Back to Home', style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}