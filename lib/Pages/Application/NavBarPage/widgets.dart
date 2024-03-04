import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/colors.dart';


var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(),
      activeIcon:_bottomContainer(color: AppColors.primaryElement),
      backgroundColor: AppColors.primaryBackground,
      label: "Home",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon:_bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon:_bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon:_bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon:_bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "search",
  ),

];

Widget _bottomContainer(
    {double width = 15,
      double height = 15,
      String imagePath = "assets/icons/home.png",
      Color color = AppColors.primaryElement}) {
  return SizedBox(
    width: 15.w,
    height: 15.w,
    child: Image.asset(imagePath,color: color,)

  );
}