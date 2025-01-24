import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key,required this.startPlace,required this.ticketPrice,required this.startTime,required this.endTime,required this.busNumber,required this.availableSeat,required this.totalSeat,required this.id});
  final String? id;
  final String? startPlace;
  final String? ticketPrice;
  final String? startTime;
  final String? endTime;
  final String? busNumber;
  final String? availableSeat;
  final String? totalSeat;

  @override
  State<BookingScreen> createState() => _DriverViewBusState();
}


class _DriverViewBusState extends State<BookingScreen> {

  loadFirebase() async {
    await getDocumentById();
  }

  @override
  void initState() {
    loadFirebase();
    // TODO: implement initState
    super.initState();
  }

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
                    SizedBox(height: 5,),
                    PCard2(price: widget.ticketPrice??"Price", town: widget.startPlace??"Town", starttime: widget.startTime??"Start Time", duration: "to", endtime: widget.endTime??"End Time", busnumber: widget.busNumber??"Bus Number", seats: widget.availableSeat??"", onTap: (){}),
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
                        BusLayout2(id:widget.id??"",blockedSheetCount: (int.parse(widget.totalSeat??"0")-int.parse(widget.availableSeat??"0")).toString(),seatCount: widget.totalSeat??"0",),
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

  Future<void> getDocumentById() async{

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user_ride_details')
        .get();

    List<Map<String, dynamic>> documents = querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
        .toList();

    print("user rides: $documents");

    List<Map<String, dynamic>> bookSheetsdocuments = [];
    for (var doc in documents) {

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('bus_trip_details')
          .doc(doc['id'])
          .collection('ride_details')
          .where('bus_details_id', isEqualTo: widget.id)
          .get();

      bookSheetsdocuments = querySnapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    }

    print(bookSheetsdocuments.toString());
  }
}