import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/services/firebase_auth_services.dart';
import 'package:triptix/widgets/widgets.dart';

import 'bus_search_screen.dart';

var logo = 'assets/images/logo.png';

class PassengerRegisterScreen extends StatefulWidget {
  PassengerRegisterScreen({super.key});

  @override
  State<PassengerRegisterScreen> createState() => _PassengerRegisterScreenState();
}

class _PassengerRegisterScreenState extends State<PassengerRegisterScreen> {

  final AuthServices _auth = AuthServices();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController mobileNumberController = TextEditingController();

  final TextEditingController nicController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  String name = '';

  String mobileNumber = '';

  String nic = '';

  String email = '';

  String password = '';

  String confirmPassword = '';

  String error = '';
  final _formKey = GlobalKey<FormState>();

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
                    child: Form(
                      key: _formKey,
                      child: Column(

                        children: [
                          Text(
                            'PASSENGER REGISTER',
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
                                  CustomTextInput(
                                    controller: nameController,
                                    hintText: "Enter your Name",
                                    onChanged: (value) {
                                      setState(() {
                                        name = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 15,),
                                  Text('Mobile Number',style: BodyText1,),
                                  SizedBox(height: 5,),
                                  CustomTextInput(
                                    controller: mobileNumberController,
                                    hintText: 'Enter your Mobile Number',
                                    onChanged: (value) {
                                      setState(() {
                                        mobileNumber = value;
                                      });
                                    },),
                                  SizedBox(height: 15,),
                                  Text('NIC Or Key',style: BodyText1,),
                                  SizedBox(height: 5,),
                                  CustomTextInput(
                                    controller: nicController,
                                    hintText: "NIC Or Key",
                                    onChanged: (value) {
                                      setState(() {
                                        nic = value;
                                      });
                                    },),
                                  SizedBox(height: 15,),
                                  Text('Email',style: BodyText1,),
                                  SizedBox(height: 5,),
                                  CustomTextInput(
                                    controller: emailController,
                                    hintText: 'Enter your Email',
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },),
                                  SizedBox(height: 15,),
                                  Text('Password',style: BodyText1,),
                                  SizedBox(height: 5,),
                                  CustomTextInput(
                                    controller: passwordController,
                                    hintText: "Enter your Password",
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },),
                                  SizedBox(height: 15,),
                                  Text('Confirm Password',style: BodyText1,),
                                  SizedBox(height: 5,),
                                  CustomTextInput(
                                    controller: confirmPasswordController,
                                    hintText: 'Confirm your Password',
                                    onChanged: (value) {
                                      setState(() {
                                        confirmPassword = value;
                                      });
                                    },),
                                  SizedBox(height: 25,),
                                  CustomButton(
                                      text: 'Register',
                                      onPressed: (){
                                        register();
                                      }
                                  ),
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
          ),
        ],
      ),
    );
  }

  register() async{

    if (password != confirmPassword || password.isEmpty || confirmPassword.isEmpty){
      EasyLoading.showToast("Password doesn't match or Empty!",toastPosition: EasyLoadingToastPosition.bottom);
      return;
    }

    if (_formKey.currentState != null && _formKey.currentState!.validate()){
      EasyLoading.show(status: "Registering......",);
      EasyLoading.instance..indicatorType = EasyLoadingIndicatorType.cubeGrid;
      await _auth.registerWithEmailAndPassword(
        emailController.text.trim().toString(),
        passwordController.text.trim().toString(),
      ).then((onValue)async{
        if(onValue == null){
          EasyLoading.showError("Registration Failed! Try Again.");
          return true;
        }
        await _auth.storeUserData(
          onValue!.uid,
          nameController.text.trim(),
          mobileNumberController.text.trim(),
          nicController.text.trim(),
          emailController.text.trim(),).then(((onValue){
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Registration Successfull!");
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => BusSearchScreen()),ModalRoute.withName("/"));
        })).catchError((onError){
          EasyLoading.dismiss();
          EasyLoading.showError("Registration Failed! Try Again.");
          print(onError);
        });
      }).catchError((onError){
        EasyLoading.dismiss();
        EasyLoading.showError("Registration Failed! Try Again.");
        print(onError);
      });
    }
    else {
      EasyLoading.showToast("Please fill all required fields!",toastPosition: EasyLoadingToastPosition.bottom);
    }
  }
}