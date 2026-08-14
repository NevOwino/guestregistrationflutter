import 'package:mobileapp/views/home.dart';
import 'package:mobileapp/views/login.dart';
import 'package:mobileapp/views/registration.dart';
import 'package:mobileapp/views/dashboard.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

var routes = [
  GetPage(name: "/", page: () => Login()),
  GetPage(name: "/register", page: () => Registration()),
  GetPage(name: "/home", page: () => HomeScreen()),
  GetPage(name: "/dashboard", page: () => Dashboard()),
];