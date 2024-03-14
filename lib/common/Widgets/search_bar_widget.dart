import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_widgets.dart';
import 'package:riverpodapp/common/Widgets/box_shadow.dart';
import 'package:riverpodapp/common/utils/colors.dart';

Widget searchBar(){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 290.w,
        height: 30.h,
        decoration: appShadowBox(border: Border.all(color: AppColors.primaryFourElementText),color: Colors.white),
        child: Row(
          children: [
            SizedBox(width: 10.w,),
            Image.asset("assets/icons/search2.png"),
            SizedBox(width: 10.w,),
            SizedBox(
                width: 240.w,
                height: 29.h,
                child: sizedbox(hintText: "Search ...")
            )
          ],
        ),
      ),
      SizedBox(width: 5.w,),
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: 35.w,
          height: 30.h,
          decoration: appShadowBox(border: Border.all(color: AppColors.primaryFourElementText),color: AppColors.primaryElement),
          child: Image.asset("assets/icons/options.png"),
        ),
      )

    ],
  );
}