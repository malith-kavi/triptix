import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

import 'bus_info_screen.dart';
import 'driver_view_bus.dart';

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
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  ),
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 25),
                  child: Wrap(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AVAILABLE BOOKINGS',
                                style: HeaderText3,
                              ),
                            ],
                          ),

                          Container(
                            height: MediaQuery.sizeOf(context).height,
                            child: FutureBuilder(future: getDocumentById(FirebaseAuth.instance.currentUser!.uid), builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                EasyLoading.show(status: "Loading Please Wait");
                                return SizedBox();
                              }
                              else if(snapshot.hasError){
                                EasyLoading.dismiss();
                                EasyLoading.showError("Failed");
                                return SizedBox();
                              }
                              else if(snapshot.data!.isEmpty){
                                EasyLoading.dismiss();
                                EasyLoading.showError("No Data");
                                return SizedBox();
                              }
                              else{
                                EasyLoading.dismiss();
                                return SizedBox(
                                  child: ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(child: customCard(snapshot.data!.elementAt(index)['id'],context,snapshot.data!.elementAt(index)['ticket_price'], snapshot.data!.elementAt(index)['start_place'], snapshot.data!.elementAt(index)['start_time'], 'to', snapshot.data!.elementAt(index)['end_time'], snapshot.data!.elementAt(index)['bus_number'], snapshot.data!.elementAt(index)['numof_seat'], snapshot.data!.elementAt(index)['block_seat_number'])),
                                      ],
                                    );
                                    },
                                  ),
                                );
                              }
                            },
                            ),
                          ),
                      ],
                      ),
                    ],
                  ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          FloatingActionButton(backgroundColor: bColor,child: Icon(Icons.add,color: Colors.white,),onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BusInfoScreen(),));
          }
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
  
  Widget customCard(String docId,BuildContext context,String price,String town,String starttime,String duration, String endtime, String busnumber, String seatnumber, String blockSheetCount){
    return Column(
      children: [
        SizedBox(height: 10,),
        GestureDetector(child: ConfirmCard(price: price, town: town, starttime: starttime, duration: duration, endtime: endtime, busnumber: busnumber, seatnumber: seatnumber, onTap: (){}),onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DriverViewBus(seatCount: seatnumber,date: "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",documentId: docId,blockedSheetCount: blockSheetCount,),));
        },),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getDocumentById(String documentId) async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bus_trip_details')
        .where('bus_user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    List<Map<String, dynamic>> documents = querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
        .toList();

    return documents;
  }
}