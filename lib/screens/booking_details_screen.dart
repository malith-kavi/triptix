import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/screens/payment_screen.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          
            Container(  
              color: Colors.white,
                child: Center(
                  child:Padding(
                    padding: const EdgeInsets.all(1),
                    child: Image.asset(
                      logo,
                      width: 200,
                      height: 100,
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
                          'BOOKING DETAILS',
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
                                Text('NIC',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "NIC"),
                                SizedBox(height: 15,),
                                Text('Email',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Enter your Email'),
                                SizedBox(height: 15,),
                                Text('Seat Number',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "Seat Number"),
                                SizedBox(height: 25,),
                                CustomButton(text: 'PAY', onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentGatewayUI(),));
                                }),
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