import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobileapp/views/api.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String totalGuests = '0';
  String checkedIn = '0';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStats();
  }

  Future<void> fetchStats() async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/get_stats.php"));
      var data = jsonDecode(response.body);

      setState(() {
        totalGuests = data['total_guests'].toString();
        checkedIn = data['checked_in'].toString();
        isLoading = false;
      });
    } catch (e) {
      print("Stats fetch error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchStats,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome, Admin',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                isLoading
                    ? Center(child: CircularProgressIndicator(color: Colors.orangeAccent))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _StatCard(label: 'Total Guests', value: totalGuests)),
                          SizedBox(width: 15),
                          Expanded(child: _StatCard(label: 'Checked In', value: checkedIn)),
                        ],
                      ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Text('Quick Actions', style: TextStyle(color: Colors.deepOrange, fontSize: 16)),
                  ],
                ),

                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    color: Colors.orangeAccent,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Register New Guest', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Get.toNamed('/guestlist');
                    },
                    color: Colors.deepOrange,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list_alt, color: Colors.white),
                        SizedBox(width: 10),
                        Text('View Guest List', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orangeAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.deepOrange)),
        ],
      ),
    );
  }
}