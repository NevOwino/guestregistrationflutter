import 'package:flutter/material.dart';

var screens = [0];
int position = 0;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [

          // Sidebar
          Container(
            width: 280,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [

                const SizedBox(height: 20),

                // Brand
                Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    children: [

                      Icon(
                        Icons.person,
                        color: Colors.deepOrange,
                        size: 28,
                      ),

                      SizedBox(width: 15),

                      Text(
                        "Welcome, Receptionist.",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: const [

                      SidebarTile(
                        icon: Icons.apps,
                        title: "Dashboard",
                        selected: true,
                      ),

                      SidebarTile(
                        icon: Icons.groups,
                        title: "Guest Management",
                      ),

                      SidebarTile(
                        icon: Icons.person_add,
                        title: "Register guest",
                      ),

                      SidebarTile(
                        icon: Icons.access_time,
                        title: "Pending requests",
                      ),

                      SidebarTile(
                        icon: Icons.verified,
                        title: "Approved guests",
                      ),

                      SidebarTile(
                        icon: Icons.calendar_month,
                        title: "Visit schedule",
                      ),

                      SidebarTile(
                        icon: Icons.logout,
                        title: "Logout",
                        isLogout: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main page
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final bool isLogout;

  const SidebarTile({
    super.key,
    required this.icon,
    required this.title,
    this.selected = false,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, bottom: 4),
      child: Material(
        color: selected ? Colors.deepOrange.shade50 : Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(48),
          bottomLeft: Radius.circular(48),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(48),
            bottomLeft: Radius.circular(48),
          ),
          onTap: () {},
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [

                Icon(
                  icon,
                  color: isLogout
                      ? Colors.red
                      : selected
                          ? Colors.deepOrange
                          : Colors.black87,
                ),

                const SizedBox(width: 20),

                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: isLogout
                        ? Colors.red
                        : selected
                            ? Colors.deepOrange
                            : Colors.black87,
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