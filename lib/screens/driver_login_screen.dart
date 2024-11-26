import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class DriverLoginScreen extends StatelessWidget {
  const DriverLoginScreen({super.key});

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
                  child: Column(
                    
                    children: [
                      Spacer(),
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
                              CustomTextInput(hintText: "Enter your Email"),
                              SizedBox(height: 25,),
                              Text('Password',style: BodyText1,),
                              SizedBox(height: 5,),
                              CustomTextInput(hintText: 'Enter your Password'),
                              SizedBox(height: 25,),
                              CustomButton(text: 'Sign In', onPressed: (){}),
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
                          SButton(text: 'Sign Up', onPressed: (){})
                        ],
                      ),
                      Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}