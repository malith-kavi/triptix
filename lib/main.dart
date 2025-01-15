import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';
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
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBaajFp31pvaKmy-jKOAIoh3IKZb3U9f0U",
          appId: "1:454497829203:android:75adc8bc7df44167bc21a6",
          messagingSenderId: "454497829203",
          projectId: "triptix-ee0b1"
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



