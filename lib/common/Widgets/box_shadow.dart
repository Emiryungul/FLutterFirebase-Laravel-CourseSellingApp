
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/common/utils/colors.dart';

BoxDecoration appShadowBox(
    {Color color = AppColors.primaryElement,
      double radius = 15,
      double sR = 1,
      double bR = 2,
      BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}
//chatty

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
      double radius = 15,
      double sR = 1,
      double bR = 2,
      BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.h),
          topRight: Radius.circular(20.h)
      ),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appTextFieldShadowBox(
    {Color color = AppColors.primaryBackground,
      double radius = 15,
      Color borderColor = AppColors.primaryFourElementText}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}
