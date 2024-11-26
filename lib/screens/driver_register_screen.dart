import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class DriverRegisterScreen extends StatelessWidget {
  const DriverRegisterScreen({super.key});

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
                      width: 260,
                      height: 150,
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
                      
                      children: [
                        Text(
                          'DRIVER REGISTER',
                          style: HeaderText3,
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
                                Text('Name',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "Enter your Name"),
                                SizedBox(height: 15,),
                                Text('Mobile Number',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Enter your Mobile Number'),
                                SizedBox(height: 15,),
                                Text('NIC Or Key',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "NIC Or Key"),
                                SizedBox(height: 15,),
                                Text('Email',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Enter your Email'),
                                SizedBox(height: 15,),
                                Text('Password',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "Enter your Password"),
                                SizedBox(height: 15,),
                                Text('Confirm Password',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Confirm your Password'),
                                SizedBox(height: 25,),
                                CustomButton(text: 'Register', onPressed: (){}),
                              ],
                            ),
                        ),
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
}