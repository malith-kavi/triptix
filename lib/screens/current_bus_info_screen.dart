import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class CurrentBusInfoScreen extends StatelessWidget {
  const CurrentBusInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_outlined)),
        title: Text('Select Your Layout'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // SafeArea(
          //   child: Container(  
          //     color: Colors.white,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
                    
          //           SizedBox(width: 10,),
          //           Column(
          //             children: [
          //               Center(
          //                 child:Padding(
          //                   padding: const EdgeInsets.all(1),
          //                   child: Image.asset(
          //                     logo,
          //                     width: 130,
          //                     height: 80,
          //                       ),
          //                     ),
          //                 ),
          //             ],
          //           ),
                    
          //         ],
          //       ),
          //       ),
          //     ),
  
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 20,),
                              BusLayout(),
                              SizedBox(width: 20,),
                              // BusLayout2(),
                              SizedBox(width: 20,),
                              // BusLayout2(),
                              SizedBox(width: 20,),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        CustomButton(text: 'Submit', onPressed: (){}),
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