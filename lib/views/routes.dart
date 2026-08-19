import 'package:mobileapp/views/login.dart';
import 'package:mobileapp/views/registration.dart';
import 'package:mobileapp/views/dashboard.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mobileapp/views/guest_list.dart';
import 'package:mobileapp/views/thank_you.dart';
import 'package:mobileapp/views/admin_signup.dart';

var routes = [
  GetPage(name: "/", page: () => Login()),
  GetPage(name: "/register", page: () => Registration()),
  GetPage(name: "/dashboard", page: () => Dashboard()),
  GetPage(name: "/guestlist", page: () => GuestList()),
  GetPage(name: "/thankyou", page: () => ThankYou()),
  GetPage(name: "/adminsignup", page: () => AdminSignup()),
];