import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:triptix/screens/booked_screen.dart';
import 'package:triptix/screens/booking_details_screen.dart';
import 'package:triptix/screens/booking_screen.dart';
import 'package:triptix/screens/bus_info_screen.dart';
import 'package:triptix/screens/bus_search_screen.dart';
import 'package:triptix/screens/bus_time_schedule.dart';
import 'package:triptix/screens/current_bus_info_screen.dart';
import 'package:triptix/screens/driver_view_bus.dart';
import 'package:triptix/screens/landing_screen.dart';
import 'package:triptix/screens/payment_screen.dart';
import 'package:triptix/screens/route_results_screen.dart';
import 'package:triptix/screens/your_booking_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentGatewayUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}



