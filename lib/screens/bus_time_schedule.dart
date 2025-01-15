import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/screens/your_booking_screen.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BusTimeSchedule extends StatefulWidget {
  const BusTimeSchedule({super.key,required this.docID});
  final String? docID;

  @override
  State<BusTimeSchedule> createState() => _BusTimeScheduleState();
}

class _BusTimeScheduleState extends State<BusTimeSchedule> {

  late final TextEditingController ticketPrice = TextEditingController();
  late final TextEditingController availableDate= TextEditingController();
  late final TextEditingController yourRoute= TextEditingController();
  late final TextEditingController blockSeatNumber = TextEditingController();

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
                                CustomTextInput(hintText: "500.00",controller: ticketPrice,),
                                SizedBox(height: 15,),
                                Text('Available Dates',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Date',controller: availableDate,),
                                SizedBox(height: 15,),
                                Text('Your Route',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: "Select Route",controller: yourRoute,),
                                SizedBox(height: 15,),
                                Text('Blocked Seat Numbers',style: BodyText1,),
                                SizedBox(height: 5,),
                                CustomTextInput(hintText: 'Seats',controller: blockSeatNumber,),
                                SizedBox(height: 25,),
                                CustomButton(text: 'Publish', onPressed: (){
                                  submitData();
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

  submitData()async{
    EasyLoading.show(status: "Publishing bus details......");
    EasyLoading.instance.indicatorType=EasyLoadingIndicatorType.cubeGrid;
    final _firestore = FirebaseFirestore.instance;

    DocumentReference<Map<String, dynamic>> users = _firestore.collection('bus_trip_details').doc(widget.docID);

    var myJSONObj = {
      "ticket_price":ticketPrice.text.trim()== ""?EasyLoading.showToast("Failed"):ticketPrice.text.trim(),
      "available_date": availableDate.text.trim() == ""?EasyLoading.showToast("Failed"):availableDate.text.trim(),
      "your_route": yourRoute.text.trim()== ""?EasyLoading.showToast("Failed"):yourRoute.text.trim(),
      "block_seat_number": blockSeatNumber.text.trim()== ""?EasyLoading.showToast("Failed"):blockSeatNumber.text.trim(),
      "bus_booking_status":"active",
    };
    await users.update(myJSONObj).then((onValue){
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Successful");
      print("User data Added to the Firestore database");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => YourBookingScreen(),));
    }).catchError((onError){
      EasyLoading.dismiss();
      EasyLoading.showError("Failed");
      print("Error $onError");
    });

  }
}