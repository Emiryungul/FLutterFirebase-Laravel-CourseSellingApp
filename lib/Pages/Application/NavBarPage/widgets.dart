import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/colors.dart';
import '../../Home/home_page.dart';


var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(),
      activeIcon:_bottomContainer(color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Home",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: "assets/icons/search2.png"),
    activeIcon:_bottomContainer(imagePath: "assets/icons/search2.png",color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "search" ,
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: "assets/icons/play-circle1.png"),
    activeIcon:_bottomContainer(imagePath: "assets/icons/play-circle1.png",color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "video",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: "assets/icons/message-circle.png"),
    activeIcon:_bottomContainer(imagePath:"assets/icons/message-circle.png" ,color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "message",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: "assets/icons/person2.png"),
    activeIcon:_bottomContainer(imagePath:"assets/icons/person2.png" ,color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Profile",
  ),


];

Widget _bottomContainer(
    {double width = 15,
      double height = 15,
      String imagePath = "assets/icons/home.png",
      Color color = AppColors.primaryElement}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: Image.asset(imagePath,color: color,)

  );
}
Widget appScreens({int index=0}){
  List<Widget> screens=[
    const HomePage(),
    Center(child: _bottomContainer() ),
    Center(child: _bottomContainer() ),
    Center(child: _bottomContainer() ),
  ];
  return screens[index];
}