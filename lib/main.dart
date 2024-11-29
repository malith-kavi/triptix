import 'package:flutter/material.dart';
import 'package:triptix/screens/bus_search_screen.dart';
import 'package:triptix/screens/driver_login_screen.dart';
import 'package:triptix/screens/driver_register_screen.dart';
import 'package:triptix/screens/landing_screen.dart';
import 'package:triptix/screens/passenger_login_screen.dart';
import 'package:triptix/screens/passenger_register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BusSearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



