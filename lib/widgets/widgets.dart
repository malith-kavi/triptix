import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

const CustomCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          splashColor: Colors.grey.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.black, 
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.0,
      height: 55.0,

      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 252, 163, 17),
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class CustomTextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final double width;
  final double height;

  const CustomTextInput({
    Key? key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.width = 272,
    this.height = 60,
  }) : super(key: key);


  static const textInputDecoration = InputDecoration(
    hintText: "Enter text",
    hintStyle: TextStyle(color: Colors.black, fontSize: 18),
    fillColor: Color.fromARGB(255, 255, 255, 255),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 252, 163, 17)),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: textInputDecoration.copyWith(
        hintText: hintText,
      ),
    );
  }
}


class SButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 250.0,
      // height: 50.0,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 220, 12, 12),
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
class PCard extends StatelessWidget {
  final String price;
  final String town;
  final String starttime;
  final String duration;
  final String endtime;
  final String busnumber;
  final String seats;
  final VoidCallback onTap;
  
  const PCard({
    required this.price, 
    required this.town, 
    required this.starttime,
    required this.duration,
    required this.endtime,
    required this.busnumber,
    required this.seats,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: BodyText3,
                    ),
                  ],
                ),
                Text(
                  town,
                  style: BodyText4,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Text(
                        starttime,
                        style: BodyText3,
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        color: Colors.black54, 
                        thickness: 1,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Text(
                        duration,
                        style: BodyText3,
                        ),
                    ),
                    
                    Expanded(
                      child: Divider(
                        color: Colors.black54, 
                        thickness: 1,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Text(
                        endtime,
                        style: BodyText3,
                        ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      busnumber,
                      style: BodyText3,
                    ),
                    Spacer(),
                    Text(
                      seats,
                      style: BodyText3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}