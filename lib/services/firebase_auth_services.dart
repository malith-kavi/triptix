import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:triptix/models/user_details.dart';


class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userWithFirebaseUserid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserid);
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }


  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // You can save additional user data like username and birthday to Firebase Firestore or Realtime Database here
      return _userWithFirebaseUserid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // Future<void> storeData(
  //     String docId, String name, String mobileNumber, String nic, String email)
  //   final _firestore = FirebaseFirestore.instance;

  //   DocumentReference<Map<String, dynamic>> users = _firestore.collection("user_details").doc(docId);

  //   var myJSONObj = {
  //     "Name": name,
  //     "MobileNumber": mobileNumber,
  //     "nicOrkey": nic,
  //     "email": email,
  //     "userType": "driver",
  //   };
  //   users.set(myJSONObj).then((value) => print("user data add to the database")).catchError((error) => print("Failed to add user: $error"));


  



  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // static Future<void> registerUserWithDetails({
  //   required String name,
  //   required String mobileNumber,
  //   required String nic,
  //   required String email,
  //   required String password,
  //   required BuildContext context,
  // }) async {
  //   try {
  //     UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email, 
  //       password: password
  //     );
  //     User? user = result.user;

  //     if (user != null){

  //       String docId = user.uid;

  //       final _firestore = FirebaseFirestore.instance;

  //       DocumentReference<Map<String, dynamic>> users = _firestore.collection("user_details").doc(docId);
  //       var myJSONObj = {
  //         "Name":name,
  //         "MobileNumber":mobileNumber,
  //         "nicOrkey":nicOrkey,
  //         "email": email,
  //         "userType": "driver",
  //       };

  //       await users.set(myJSONObj);

  //       print("User registered and data added to Firestore successfully");
  //     }

  //   //   print("User registered with UID: ${userCredential.user?.uid}");


  //   //   // UserDetails driverDetails = UserDetails(
  //   //   //   name: name,
  //   //   //   mobileNumber: mobileNumber,
  //   //   //   nicOrkey: nicOrkey,
  //   //   //   email: email,
  //   //   //   userType: 'driver',
  //   //   // );

  //   //   final driverData ={
  //   //     "name": name,
  //   //     "mobileNumber": mobileNumber,
  //   //     "nicOrkey": nicOrkey,
  //   //     "email": email,
  //   //     "userType": "driver",
  //   //   };


  //   //   await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set(driverData).then((value) => print("User details saved to Firestore")).catchError((error) {
  //   //     print("Error saving user details to Firestore: $error");
  //   //   });

  //   //   ScaffoldMessenger.of(context).showSnackBar(
  //   //     const SnackBar(content: Text('Driver registered successfully!')),
  //   //   );

      
  //   } catch (e) {
  //     print("Error during registration: $e ");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error: ${e.toString()}')),
  //     );
  //   }
  // }



  // static Future<void> registerPassenger({
  //   required String name,
  //   required String mobileNumber,
  //   required String nicOrkey,
  //   required String email,
  //   required String password,
  //   required BuildContext context,
  // }) async {
  //   try {

  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email, 
  //       password: password
  //     );

  //     await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
  //       'name':name,
  //       'mobileNumber':mobileNumber,
  //       'nicOrkey':nicOrkey,
  //       'email':email,
  //       'userType':'passenger',
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Passenger registered successfully!')),
  //     );

  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error: ${e.toString()}')),
  //     );
  //   }
  // }
}