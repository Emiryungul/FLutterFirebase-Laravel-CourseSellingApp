
import 'package:flutter/material.dart';
import 'package:riverpodapp/common/utils/colors.dart';
import 'package:riverpodapp/common/utils/constants.dart';

import '../../common/Widgets/box_shadow.dart';
import '../../common/Widgets/text_widgets.dart';
import '../../global.dart';

Widget pageViewOnboarding({
  required PageController controller,
  String imagePath="",
  required String title,
  required String subtitle,
  index =0,
  required BuildContext context
  })
{
  return  Column(
    children: [
      Image.asset(imagePath),
      const SizedBox(height: 10,),
      Container(

        child:
        text24Widget(text: title,fontWeight: FontWeight.bold, textColor: Colors.black),
      ),
      Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child:
        text16Widget(text: subtitle,fontWeight: FontWeight.normal, textColor: Colors.black  ),
      ),
      const SizedBox(height: 100,),
      _nextButton(index, controller, context)
    ],
  );
}

Widget _nextButton(int index,PageController controller, BuildContext context){
  return GestureDetector(
    onTap: (){
      bool deviceFirstOpenKey = Global.storageService.getDeviceFirstOpen();
      print(deviceFirstOpenKey);
      if(index<3){
        controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease);
      }else{
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_FIRST_LOGIN_KEY, true);
       Navigator.pushNamed(context, "/SignIn");
      }
    },
    child: Container(
      width: 300,
      height: 55,
      decoration: appBoxShadow(),
      child: Center(child: text16Widget(text: index<3 ? "next"  : "Get Started", fontWeight: FontWeight.bold, textColor: Colors.black)),
    ),
  );
}