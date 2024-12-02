import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BusTimeSchedule extends StatelessWidget {
  const BusTimeSchedule({super.key});

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
                          'BUS TIME SCHEDULE',
                          style: HeaderText3,
                        ),
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                            child: Padding(padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ticket Price',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "500.00"),
                                SizedBox(height: 15,),
                                Text('Available Dates',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Date'),
                                SizedBox(height: 5,),
                                
                                CustomTextInput(hintText: ""),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: ''),
                                SizedBox(height: 15,),
                                Text('Your Route',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "Select Route"),
                                SizedBox(height: 15,),
                                Text('Blocked Seat Numbers',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Seats'),
                                SizedBox(height: 25,),
                                CustomButton(text: 'Publish', onPressed: (){}),
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