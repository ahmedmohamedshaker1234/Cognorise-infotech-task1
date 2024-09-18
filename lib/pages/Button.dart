import 'package:flutter/material.dart';

class Button extends StatelessWidget {
final Color? buttoncolor;
final String buttontext;
final Color? textcolor;
final void Function()? tapped;
  const Button({super.key, required this.buttoncolor, required this.buttontext, required this.textcolor, required this.tapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton (
        onPressed: tapped,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor,
          shape:const CircleBorder(),
        ),
        child: Text(buttontext,
        style: 
        TextStyle(fontSize: 26
        ,color:textcolor,fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}