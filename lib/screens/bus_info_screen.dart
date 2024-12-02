import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';
import 'package:triptix/widgets/widgets.dart';

var logo = 'assets/images/logo.png';

class BusInfoScreen extends StatelessWidget {
  const BusInfoScreen({super.key});

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
                        Text('Bus Number',style: BodyText1,),
                              SizedBox(height: 5,),
                              CustomTextInput(hintText: "Ex NE - 3892"),
                              SizedBox(height: 25,),
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