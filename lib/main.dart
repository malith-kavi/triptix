import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:triptix/screens/landing_screen.dart';

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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}



