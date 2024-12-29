import 'package:flutter/material.dart';
import 'package:triptix/screens/booking_details_screen.dart';
import 'package:triptix/screens/bus_info_screen.dart';
import 'package:triptix/screens/bus_search_screen.dart';
import 'package:triptix/screens/bus_time_schedule.dart';
import 'package:triptix/screens/current_bus_info_screen.dart';
import 'package:triptix/screens/landing_screen.dart';
import 'package:triptix/screens/payment_screen.dart';
import 'package:triptix/screens/route_results_screen.dart';
import 'package:triptix/screens/your_booking_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YourBookingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



