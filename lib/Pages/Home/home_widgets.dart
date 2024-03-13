import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Home/controller/home_controller.dart';
import 'package:riverpodapp/common/Widgets/box_shadow.dart';

import '../../common/Widgets/text_widgets.dart';
import '../../global.dart';

Widget helloText(){
  return text24Widget(text: "Welcome", fontWeight: FontWeight.bold, textColor: Colors.grey);
}
Widget nameText(){
  return text24Widget(
      text: Global.storageService.getUserProfile().name!,
      fontWeight: FontWeight.bold,
      textColor: Colors.black
  );
}


Widget bannerWidget({required WidgetRef ref}){
  return Column(
    children: [
      SizedBox(
        //padding: const EdgeInsets.only(left: 10),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (index){
            ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
          },
          children: [
              _bannerContainer(imagePath: "assets/images/3rdimage.jpg"),
              _bannerContainer(imagePath: "assets/images/3rdimage.jpg")
            ],
        ),
      ),
      DotsIndicator(
        position: ref.watch(homeScreenBannerDotsProvider),
        dotsCount: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
          size:  Size(9.0.w,9.0.w),
          activeSize:  Size(24.0.w, 9.0.w),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    ],
  );


}

Widget _bannerContainer({String? imagePath}){
  return Container(
      width: 325.w,
      height: 150.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath!),
          fit: BoxFit.cover
        ),
      )
  );
}