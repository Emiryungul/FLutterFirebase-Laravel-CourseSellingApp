import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_widgets.dart';
import 'package:riverpodapp/common/Widgets/box_shadow.dart';
import 'package:riverpodapp/common/Widgets/text_widgets.dart';
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
            Container(
                width: 240.w,
                height: 29.h,
                child: sizedbox(hintText: "Search")
            )
          ],
        ),
      ),
      //Icon(Icons.,color: AppColors.primaryElement,)
    ],
  );
}