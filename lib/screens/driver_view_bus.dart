import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/screens/your_booking_screen.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class DriverViewBus extends StatefulWidget {
  const DriverViewBus({super.key,required this.seatCount,required this.date,required this.documentId,required this.blockedSheetCount});
  final String? seatCount;
  final String? documentId;
  final String? date;
  final String? blockedSheetCount;

  @override
  State<DriverViewBus> createState() => _DriverViewBusState();
}

class _DriverViewBusState extends State<DriverViewBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Date: ${widget.date}"),
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
                                color: Colors.green,
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
                        SingleChildScrollView(child: BusLayout(seatCount: widget.seatCount??'0',blockedSheetCount: widget.blockedSheetCount??'0',)),
                        SizedBox(height: 20,),
                        CustomButton(text: 'Stop Booking Now', onPressed: (){
                          stopBooking();
                        }),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon:Icon(Icons.delete_sweep_rounded,
                              color: Colors.white,),
                              onPressed: (){
                                deleteBooking();
                              }),
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

  stopBooking() async {
    EasyLoading.show(status: "Stop Booking......");
    EasyLoading.instance.indicatorType=EasyLoadingIndicatorType.cubeGrid;
    final _firestore = FirebaseFirestore.instance;

    DocumentReference<Map<String, dynamic>> users = _firestore.collection('bus_trip_details').doc(widget.documentId);

    var myJSONObj = {
      "bus_booking_status":"inactive",
    };
    await users.update(myJSONObj).then((onValue){
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Stoped");
      print("User data Added to the Firestore database");
    }).catchError((onError){
      EasyLoading.dismiss();
      EasyLoading.showError("Failed");
      print("Error $onError");
    });
  }

  deleteBooking(){
    EasyLoading.show(status: "Deleting......");
    EasyLoading.instance.indicatorType=EasyLoadingIndicatorType.cubeGrid;
    final _firestore = FirebaseFirestore.instance;

    _firestore.collection('bus_trip_details').doc(widget.documentId).delete().then((onValue){
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Deleted");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => YourBookingScreen(),));
    }).catchError((onError){
      EasyLoading.dismiss();
      EasyLoading.showError("Failed");
      print(onError);
    });
  }
}