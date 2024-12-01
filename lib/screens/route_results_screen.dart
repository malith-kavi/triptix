import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class RouteResultsScreen extends StatelessWidget {
  const RouteResultsScreen({super.key});

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Colombo'),
                        SizedBox(height: 15,),
                        Text('Fri, 20 Sep'),
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
                        Text('Kurunegala'),
                        SizedBox(height: 15,),
                        Text('Fri, 20 Sep'),
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
                        PCard(price: '500', town: 'Kurunegala', starttime: '8.00', duration: '0.30', endtime: '8.30', busnumber: 'NB - 8876', seats: '30', onTap: (){}),
                        SizedBox(height: 20,),
                        PCard(price: '500', town: 'Kurunegala', starttime: '8.00', duration: '0.30', endtime: '8.30', busnumber: 'NB - 8876', seats: '30', onTap: (){}),
                        SizedBox(height: 20,),
                        PCard(price: '500', town: 'Kurunegala', starttime: '8.00', duration: '0.30', endtime: '8.30', busnumber: 'NB - 8876', seats: '30', onTap: (){}),
                        SizedBox(height: 20,),
                        PCard(price: '500', town: 'Kurunegala', starttime: '8.00', duration: '0.30', endtime: '8.30', busnumber: 'NB - 8876', seats: '30', onTap: (){}),
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