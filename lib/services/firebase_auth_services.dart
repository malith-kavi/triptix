import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'name':name,
        'mobileNumber':mobileNumber,
        'nicOrkey':nicOrkey,
        'email':email,
        'userType':'driver',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Driver registered successfully!')),
      );

      
    } catch (e) {
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