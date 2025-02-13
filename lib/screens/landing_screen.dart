import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/screens/driver_login_screen.dart';
import 'package:triptix/screens/passenger_login_screen.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      width: 360,
                      height: 300,
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
                          'Simplify Your\n Travel Plans',
                          style: HeaderText2,
                        ),
                         SizedBox(height: 10,),
                        SizedBox(
                          height: 300,
                          child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1,
                          children: [
                            CustomCard(
                              icon: Icons.bus_alert_rounded, 
                              text: 'Driver Login', 
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DriverLoginScreen()));
                              }),
                            CustomCard(
                              icon: Icons.emoji_people_rounded, 
                              text: 'User Login', 
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PassengerLoginScreen()));
                              }),
                            
                          ]
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