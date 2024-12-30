import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:triptix/models/user_details.dart';

class FirebaseAuthServices {
  static Future<void> registerDriver({
    required String name,
    required String mobileNumber,
    required String nicOrkey,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      print("User registered with UID: ${userCredential.user?.uid}");


      UserDetails driverDetails = UserDetails(
        name: name,
        mobileNumber: mobileNumber,
        nicOrkey: nicOrkey,
        email: email,
        userType: 'driver',
      );

      print("Data to be saved: ${driverDetails.toFirestore()}");


      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set(driverDetails.toFirestore()).then((value) => print("User details saved to Firestore")).catchError((error) {
        print("Error saving user details to Firestore: $error");
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Driver registered successfully!')),
      );

      
    } catch (e) {
      print("Error during registration: $e ");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }



  static Future<void> registerPassenger({
    required String name,
    required String mobileNumber,
    required String nicOrkey,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'name':name,
        'mobileNumber':mobileNumber,
        'nicOrkey':nicOrkey,
        'email':email,
        'userType':'passenger',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passenger registered successfully!')),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}