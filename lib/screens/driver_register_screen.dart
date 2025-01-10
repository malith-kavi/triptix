import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/screens/your_booking_screen.dart';
import 'package:triptix/services/firebase_auth_services.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class DriverRegisterScreen extends StatefulWidget {
  DriverRegisterScreen({super.key});

  @override
  State<DriverRegisterScreen> createState() => _DriverRegisterScreenState();
}


class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
// final AuthServices _auth = AuthServices.set();
final _formKey = GlobalKey<FormState>();

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

  @override
  void dispose(){
    nameController.dispose();
    mobileNumberController.dispose();
    nicController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                                // CustomButton(
                                //   text: 'Register', 
                                //   onPressed: ()async{
                                //     if (passwordController.text != confirmPasswordController.text){
                                //       ScaffoldMessenger.of(context).showSnackBar(
                                //         const SnackBar(content: Text('Password do not match')),
                                //       );
                                //       return;
                                //     }
                                //     if (_formKey.currentState!.validate()){
                                //       dynamic result = await _auth.registerWithEmailAndPassword(
                                //         email, 
                                //         password,
                                //       );

                                //       if(result == null){
                                //         setState(
                                //           () => error = "User Already Registered");
                                //       } else {
                                //         await _auth.storeData(
                                //           result.uid, name, mobileNumber, nic, email);
                                //         Navigator.push(context, MaterialPageRoute(builder: (context) => YourBookingScreen()),
                                //         );
                                //         }
                                //       }
                                //     }

                                //     // FirebaseAuthServices.registerUserWithDetails(
                                //     //   name: nameController.text, 
                                //     //   mobileNumber: mobileNumberController.text, 
                                //     //   nicOrkey: nicController.text, 
                                //     //   email: emailController.text, 
                                //     //   password: passwordController.text, 
                                //     //   context: context,
                                //     // );
                                  
                                // ),
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