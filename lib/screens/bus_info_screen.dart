import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker_selector/date_time_picker_selector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/screens/driver_view_bus.dart';
import 'package:triptix/widgets/widgets.dart';

import 'bus_time_schedule.dart';

var logo = 'assets/images/logo.png';

class BusInfoScreen extends StatefulWidget {
  const BusInfoScreen({super.key});

  @override
  State<BusInfoScreen> createState() => _BusInfoScreenState();
}

class _BusInfoScreenState extends State<BusInfoScreen> {
  late final TextEditingController busNumberController = TextEditingController();
  late final TextEditingController start= TextEditingController();
  late final TextEditingController end= TextEditingController();
  late final TextEditingController startTime = TextEditingController(text: "${TimeOfDay.now().hour.toString()}:${TimeOfDay.now().minute.toString()}");
  late final TextEditingController endTime= TextEditingController();
  late final TextEditingController routeNumber= TextEditingController();
  late final TextEditingController seatNumber= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bus Number',
                          style: BodyText1,
                          ),
                        SizedBox(height: 10,),
                        CustomTextInput(hintText: "Ex: NE - 3892",controller: busNumberController,),
                        SizedBox(height: 25,),
                        Text(
                          'Route',
                          style: BodyText1,
                          ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Start',style: BodyText2,),
                                SizedBox(height: 10,),
                                CustomTextInput2(hintText: 'kurunegala',controller: start,),
                                SizedBox(height: 20,),
                                Text('End',style: BodyText2,),
                                SizedBox(height: 10,),
                                CustomTextInput2(hintText: 'Colombo',controller: end,),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Start Time',style: BodyText2,),
                                SizedBox(height: 10,),
                                SizedBox(
                                  width: 120,
                                  height: 45,
                                  child: DateTimePicker(
                                    type: DateTimePickerType.time,
                                    controller: startTime,
                                    icon: Icon(Icons.access_time,color: Colors.black,),
                                    timeLabelText: "Time",
                                    use24HourFormat: false,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(color: Colors.black),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(color: Colors.transparent,width: 0.5),
                                      )
                                    ),
                                    onChanged: (value) {
                                      // Update the controller's text whenever the value changes
                                      setState(() {
                                        startTime.text = value;
                                      });
                                      EasyLoading.showToast(value); // Show a toast with the selected value
                                    },
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Text('End Time',style: BodyText2,),
                                SizedBox(height: 10,),
                                CustomTextInput2(hintText: '11.00 PM',controller: endTime,),
                              ],
                            ),
                          ],

                        ),
                        SizedBox(height: 20,),
                        Text('Route Number',style: BodyText1,),
                        SizedBox(height: 20,),
                        CustomTextInput(hintText: '06',controller: routeNumber,),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Number Of Seats',style: BodyText1,),
                            SizedBox(width: 10,),
                            CustomTextInput3(hintText: '54',controller: seatNumber,),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Center(child: CustomButton(text: 'Next', onPressed: (){
                          submitData();
                        }))
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

    DocumentReference<Map<String, dynamic>> users = _firestore.collection('bus_trip_details').doc();

    var myJSONObj = {
      "bus_user_id":FirebaseAuth.instance.currentUser!.uid,
      "bus_number": busNumberController.text.trim() == ""?EasyLoading.showToast("Failed"):busNumberController.text.trim(),
      "start_place": start.text.trim()== ""?EasyLoading.showToast("Failed"):start.text.trim(),
      "start_time": startTime.text.trim()== ""?EasyLoading.showToast("Failed"):startTime.text.trim(),
      "end_place": end.text.trim()== ""?EasyLoading.showToast("Failed"):end.text.trim(),
      "end_time": endTime.text.trim()== ""?EasyLoading.showToast("Failed"):endTime.text.trim(),
      "route_number": routeNumber.text.trim()== ""?EasyLoading.showToast("Failed"):routeNumber.text.trim(),
      "numof_seat": seatNumber.text.trim()== ""?EasyLoading.showToast("Failed"):seatNumber.text.trim(),
    };
    await users.set(myJSONObj).then((onValue){
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Successful");
      print("User data Added to the Firestore database");
      Navigator.push(context, MaterialPageRoute(builder: (context) => BusTimeSchedule(docID: users.id,),));
    }).catchError((onError){
      EasyLoading.dismiss();
      EasyLoading.showError("Failed");
      print("Error $onError");
    });

  }
}