import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _DriverViewBusState();
}


class _DriverViewBusState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_outlined)),
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
                    SizedBox(height: 5,),
                    PCard2(price: 'RS.500.00', town: 'Kurunegala', starttime: '7.00 AM', duration: '1h 30min', endtime: '8.30 AM', busnumber: 'NE - 8760', seats: '54', onTap: (){}),
                    SizedBox(height: 5,),
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
                        SizedBox(height: 20,),
                        BusLayout(),
                        SizedBox(height: 20,),
                        CustomButton(text: 'Book Now', onPressed: (){}),
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