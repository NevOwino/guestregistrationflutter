
import 'package:flutter/material.dart';
var screens=[
  0];
  int position = 0;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        
        elevation: 2,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () {
          //     // Navigate back to login and clear stack
          //     Navigator.pushAndRemoveUntil(
          //       context,
          //       MaterialPageRoute(builder: (_) => const DashboardPage()),
          //       (route) => false,
          //     );
          //   },
          // ),
        ],
      ),
      body:Column()
      
    );
  }
}