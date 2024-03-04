import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/common/Widgets/box_shadow.dart';
import 'package:riverpodapp/common/Widgets/text_widgets.dart';

import '../utils/colors.dart';


Widget appButton({
  double width = 325,
  double height = 45,
  String buttonName = "",
  bool isLogin = true,
  BuildContext? context,
  void Function()? func
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: height.h,
      //isLogin true then send primary color else send white color
      decoration: appShadowBox(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Center(
          child: text16Widget(
              text: buttonName,
              textColor: isLogin
                  ? AppColors.primaryBackground
                  : AppColors.primaryText, fontWeight: FontWeight.bold, )),
    ),
  );
}
