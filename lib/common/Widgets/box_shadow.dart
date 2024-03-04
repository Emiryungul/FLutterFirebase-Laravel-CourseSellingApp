
import 'package:flutter/material.dart';
import 'package:riverpodapp/common/utils/colors.dart';

BoxDecoration appShadowBox({double Radius = 15, double sR = 1, double bR = 2,required Color color, required Border border}){
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(Radius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(0,1),

        )
      ]
  );
}

BoxDecoration appTextFieldShadowBox({double Radius = 15, double sR = 1, double bR = 2,}){
  return BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: BorderRadius.circular(Radius),
      border: Border.all(color: AppColors.primaryFourElementText)

  );
}