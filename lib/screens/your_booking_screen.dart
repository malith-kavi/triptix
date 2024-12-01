import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class YourBookingScreen extends StatelessWidget {
  const YourBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
            Container(  
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
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'YOUR BOOKINGS',
                              style: HeaderText3,
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        ConfirmCard(price: '200', town: 'colombo', starttime: '8.00', duration: '0.45', endtime: '8.45', busnumber: 'ND - 4532', seatnumber: '56', onTap: (){}),
                        SizedBox(height: 10,),
                        ConfirmCard(price: '200', town: 'colombo', starttime: '8.00', duration: '0.45', endtime: '8.45', busnumber: 'ND - 4532', seatnumber: '56', onTap: (){}),
                        SizedBox(height: 10,),
                        ConfirmCard(price: '200', town: 'colombo', starttime: '8.00', duration: '0.45', endtime: '8.45', busnumber: 'ND - 4532', seatnumber: '56', onTap: (){}),
                        SizedBox(height: 10,),
                        ConfirmCard(price: '200', town: 'colombo', starttime: '8.00', duration: '0.45', endtime: '8.45', busnumber: 'ND - 4532', seatnumber: '56', onTap: (){}),
                        
                        
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