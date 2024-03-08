
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

 Widget text24Widget({required String text,required FontWeight fontWeight,required Color textColor}){
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


Widget text16Widget({required String text,required FontWeight fontWeight,required Color textColor}){
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
Widget text9Widget({required String text,required FontWeight fontWeight,required Color textColor}){
  return Text

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