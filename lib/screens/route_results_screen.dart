import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

import 'booking_screen.dart';

var logo = 'assets/images/logo.png';

class RouteResultsScreen extends StatefulWidget {
  const RouteResultsScreen({super.key,required this.date,required this.from,required this.to});
  final String? from;
  final String? to;
  final String? date;

  @override
  State<RouteResultsScreen> createState() => _RouteResultsScreenState();
}

class _RouteResultsScreenState extends State<RouteResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.from??"Start Place"),
                        SizedBox(height: 15,),
                        Text(widget.date??"Date"),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Center(
                          child:Padding(
                            padding: const EdgeInsets.all(1),
                            child: Image.asset(
                              logo,
                              width: 120,
                              height: 70,
                                ),
                              ),
                          ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text(widget.to??"End Place"),
                        SizedBox(height: 15,),
                        Text(widget!.date??"Date"),
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
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          child: FutureBuilder(future: getDocumentById(), builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              EasyLoading.show(status: "Loading Please Wait");
                              return SizedBox();
                            }
                            else if(snapshot.hasError){
                              EasyLoading.dismiss();
                              EasyLoading.showError("Failed");
                              print(snapshot.error);
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
                                  String availableSeat = (int.parse(snapshot.data!.elementAt(index)['numof_seat'])-int.parse(snapshot.data!.elementAt(index)['block_seat_number'])).toString();
                                  return Column(
                                    children: [
                                      Container(child: pcCard(snapshot.data!.elementAt(index)['id'],snapshot.data!.elementAt(index)['ticket_price'], snapshot.data!.elementAt(index)['start_place'], snapshot.data!.elementAt(index)['start_time'], 'to', snapshot.data!.elementAt(index)['end_time'], snapshot.data!.elementAt(index)['bus_number'], availableSeat,snapshot.data!.elementAt(index)['numof_seat'])),
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
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pcCard(String id,String price, String town, String starttime, String duration, String endtime, String busnumber, String seats, String totalSeat){
    return
      Column(
       children: [
         SizedBox(height: 10,),
         GestureDetector(child: PCard(id: id,price: price, town: town, starttime: starttime, duration: duration, endtime: endtime, busnumber: busnumber, seats: seats, onTap: (){}),onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(id:id,availableSeat: seats,busNumber: busnumber,endTime: endtime,startTime: starttime,startPlace: town,ticketPrice: price,totalSeat: totalSeat),));
         },)
       ],
      );
  }

  Future<List<Map<String, dynamic>>> getDocumentById() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bus_trip_details')
        .where('start_place', isEqualTo: widget.from)
        .where('end_place', isEqualTo: widget.to)
        .where('available_date', isEqualTo: widget.date)
        .get();

    List<Map<String, dynamic>> documents = querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
        .toList();

    return documents;
  }
}