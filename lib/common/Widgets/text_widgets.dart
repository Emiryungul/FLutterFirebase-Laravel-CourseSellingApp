
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

 class text24Widget extends StatelessWidget {
   final String text;
   final FontWeight fontWeight;
   final Color textColor;
   const text24Widget({super.key, required this.text, required this.fontWeight, required this.textColor});

   @override
   Widget build(BuildContext context) {
     return Text
       (
         text,
         textAlign: TextAlign.center,
         style: TextStyle
           (fontSize: 24,
           color: textColor,
           fontWeight: fontWeight,
         )
     );
   }
 }


class text16Widget extends StatelessWidget {
   final String text;
   final FontWeight fontWeight;
   final Color? textColor;
  const text16Widget({super.key, required this.text, required this.fontWeight,  this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text
      (
        text,
        textAlign: TextAlign.center,
        style: TextStyle
          (fontSize: 16,
          color: textColor,
          fontWeight: fontWeight,
        )
    );
  }
}


class text9Widget extends StatelessWidget {
   final String text;
   final FontWeight fontWeight;
   final Color textColor;
  const text9Widget({super.key, required this.text, required this.fontWeight, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return  Text
      (
        text,
        textAlign: TextAlign.center,
        style: TextStyle
          (fontSize: 9,
          color: textColor,
          fontWeight: fontWeight,
        )
    );
  }
}


Widget textUnderline({String text="Forgot Password ?"}){
  return GestureDetector(
    onTap: (){
    },
    child:  Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,

      ),
    ),
  );
}