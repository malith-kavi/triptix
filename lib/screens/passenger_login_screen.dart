import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/screens/passenger_register_screen.dart';
import 'package:triptix/widgets/widgets.dart';

import '../services/firebase_auth_services.dart';
import 'bus_search_screen.dart';

var logo = 'assets/images/logo.png';

class PassengerLoginScreen extends StatefulWidget {
  const PassengerLoginScreen({super.key});

  @override
  State<PassengerLoginScreen> createState() => _PassengerLoginScreenState();
}

class _PassengerLoginScreenState extends State<PassengerLoginScreen> {

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              color: Colors.white,
                child: Center(
                  child:Padding(
                    padding: const EdgeInsets.all(1),
                    child: Image.asset(
                      logo,
                      width: 360,
                      height: 200,
                        ),
                      ),
                  ),
                ),
              ),

          Expanded(
            child:Container(
              decoration: const BoxDecoration(
                color: bColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 25),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text(
                          ' WELCOME',
                          style: HeaderText2,
                        ),
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                            child: Padding(padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "Enter your Email",controller: emailController,),
                                SizedBox(height: 25,),
                                Text('Password',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Enter your Password',controller: passwordController,),
                                SizedBox(height: 25,),
                                CustomButton(text: 'Sign In', onPressed: (){
                                  login(context);
                                }),
                                SizedBox(height: 10,),
                                SButton(text: 'Forgot password?', onPressed: (){})
                              ],
                            ),
                            ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account ?',style: BodyText2,),
                            SButton(
                              text: 'Sign Up',
                              onPressed: (){
                                Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => PassengerRegisterScreen()));
                              })
                          ],
                        ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  login(BuildContext context) async{
    EasyLoading.show(status: "Login......",);
    EasyLoading.instance..indicatorType = EasyLoadingIndicatorType.cubeGrid;
    await AuthServices().signInWithEmailAndPassword(emailController.text.trim().toString(), passwordController.text.trim().toString()).then((onValue){
      if(onValue == null){
        EasyLoading.dismiss();
        EasyLoading.showError("Login failed!");
        return true;
      }
      else{
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Login Successfull!");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => BusSearchScreen()),ModalRoute.withName("/"));
      }
    }).catchError((onError){
      EasyLoading.dismiss();
      EasyLoading.showError("Login Failed! Try Again.");
      print(onError);
    });
  }
}