import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BusSearchScreen extends StatelessWidget {
  const BusSearchScreen({super.key});

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
                      width: 250,
                      height: 145,
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 25),
                    child: Column(
                      
                      children: [
                        //Spacer(),                      
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25)),
                            child: Padding(padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('From',style: BodyText1,),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 50, 0),
                                  child: TextField(),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.arrow_upward_rounded,color: Colors.white,),
                                    Icon(Icons.arrow_downward_rounded,color: Colors.white,),
                                  ],
                                ),
                                //SizedBox(height: 20,),
                                Text('To',style: BodyText1,),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 50, 0),
                                  child: TextField(),
                                ),
                                SizedBox(height: 25,),
                            
                              ],
                            ),
                            ),
                        ),
                        SizedBox(height: 25,),                     
                        CustomTextInput(hintText: 'Data Selection'),
                        SizedBox(height: 20,),
                        CustomTextInput(hintText: 'Passenger Count'),
                        SizedBox(height: 40,),
                        CustomButton(text: 'Search', onPressed: (){}),
                  
                  
                        //Spacer(),
                        SizedBox(height: 20,)
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