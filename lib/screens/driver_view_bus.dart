import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class DriverViewBus extends StatefulWidget {
  const DriverViewBus({super.key});

  @override
  State<DriverViewBus> createState() => _DriverViewBusState();
}
var date = 'Date';

class _DriverViewBusState extends State<DriverViewBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_outlined)),
        title: Text(date),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Container(  
              color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.square_rounded,color: Colors.red),
                            SizedBox(width: 10,),
                            Text('Booked',style: BodyText5,),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black, 
                                  width: 1.0, 
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.square_rounded,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text('Available',style: BodyText5,),
                          ],
                        ),
                        
                        SizedBox(width: 20,),
                        
                        
                      ],
                    ),
                  ],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BusLayout(),
                        SizedBox(height: 20,),
                        CustomButton(text: 'Stop Booking Now', onPressed: (){}),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon:Icon(Icons.delete_sweep_rounded,
                              color: Colors.white,),
                              onPressed: (){}),
                          ],
                        )
                      ]
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