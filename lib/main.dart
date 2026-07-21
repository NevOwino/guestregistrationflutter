import 'package:flutter/material.dart';


import 'package:mobileapp/views/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(GuestRegistration());
}

class GuestRegistration extends StatefulWidget {
  const GuestRegistration({super.key});

  @override
  State<GuestRegistration> createState() => _GradingAppState();
}

class _GradingAppState extends State<GuestRegistration> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: routes,
    );
  }
}