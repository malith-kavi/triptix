import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BookedScreen extends StatelessWidget {
  const BookedScreen({super.key});

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
                  ),
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 25),
                  child: SingleChildScrollView(
                    child: Column(
                      
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MY BOOKINGS',
                              style: HeaderText3,
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: MediaQuery.sizeOf(context).height,
                          child: FutureBuilder(future: getDocumentById(), builder: (context, snapshot) {
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
                                      Container(child: customCard(snapshot.data!.elementAt(index)['id'],context,snapshot.data!.elementAt(index)['ticket_price'], snapshot.data!.elementAt(index)['start_place'], snapshot.data!.elementAt(index)['start_time'], 'to', snapshot.data!.elementAt(index)['end_time'], snapshot.data!.elementAt(index)['bus_number'], snapshot.data!.elementAt(index)['booked_seats'], snapshot.data!.elementAt(index)['block_seat_number'])),
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

  Widget customCard(String docId,BuildContext context,String price,String town,String starttime,String duration, String endtime, String busnumber, List<dynamic> seatnumber, String blockSheetCount){
    return Column(
      children: [
        SizedBox(height: 10,),
        ConfirmCard(price: price, town: town, starttime: starttime, duration: duration, endtime: endtime, busnumber: busnumber, seatnumber: seatnumber.toString(), onTap: (){}),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> getDocumentById() async{

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user_ride_details')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('ride_details')
        .get();

    List<Map<String, dynamic>> documents = querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
        .toList();

    List<Map<String, dynamic>> busDetails = [];

    for (var doc in documents) {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await FirebaseFirestore.instance
          .collection('bus_trip_details')
          .doc(doc['bus_details_id'])
          .get();

      busDetails.add({
        'id': documentSnapshot.id,
        'booked_seats':doc['booked_sheet'],
        ...documentSnapshot.data() as Map<String, dynamic>,
      });
    }

    print(busDetails);
    return busDetails;
  }

}