import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Home/controller/home_controller.dart';
import 'package:riverpodapp/common/Widgets/box_shadow.dart';
import 'package:riverpodapp/common/utils/colors.dart';

import '../../common/Widgets/image_widgets.dart';
import '../../common/Widgets/text_widgets.dart';
import '../../global.dart';


class helloText extends StatelessWidget {
  const helloText({super.key});

  @override
  Widget build(BuildContext context) {
    return const text24Widget(
        text: "Welcome",
        fontWeight: FontWeight.bold,
        textColor: Colors.grey
    );
  }
}

class nameText extends StatelessWidget {
  const nameText({super.key});

  @override
  Widget build(BuildContext context) {
    return text24Widget(
        text: Global.storageService.getUserProfile().name!,
        fontWeight: FontWeight.bold,
        textColor: Colors.black
    );
  }
}

class BannerWidget extends StatelessWidget {
  final WidgetRef ref;
  final PageController controller;
  const BannerWidget({super.key, required this.ref, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //padding: const EdgeInsets.only(left: 10),
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index){
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              _bannerContainer(imagePath: "assets/images/foto1.jpg"),
              _bannerContainer(imagePath: "assets/images/foto2.jpg"),
              _bannerContainer(imagePath: "assets/images/foto3.jpg")
            ],
          ),
        ),
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
            size:  Size(7.0.w,7.0.w),
            activeSize:  Size(24.0.w, 9.0.w),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            activeColor: AppColors.primaryElement ,
            //color: AppColors.primaryElement
          ),
        ),
      ],
    );
  }
}


Widget _bannerContainer({String? imagePath}){
  return Container(
      width: 325.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.w),
        image: DecorationImage(image: AssetImage(imagePath!),
          fit: BoxFit.cover,
          
        ),
      )
  );
}

AppBar homeAppBar(){
  return AppBar(
    title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/icons/menu.png",width: 20.w,height: 20.h,),
          GestureDetector(
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration:  const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/person(1).png",),
                  fit: BoxFit.cover
                )
              ),
            ),
          )
        ],
      ),

  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h,),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const text16Widget(text: "Choose Your Course", fontWeight: FontWeight.bold,),
              SizedBox(width: 145.w,),
              GestureDetector(
                child: const text16Widget(text: 'See All', fontWeight: FontWeight.bold, textColor: Colors.black38,)
              ),
              SizedBox(width: 15.w,)
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        //course item button
        Row(
          children: [
            buttonContainer(),
            SizedBox(width: 5.w,),
            buttonContainer(text: "All Courses"),
            SizedBox(width: 5.w,),
            buttonContainer()
          ],
        )
      ],
    );
  }
}
class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 1

          ),
          itemCount: 4,
          itemBuilder: (_, int index){
            return appImage();
          }
      ),
    );
  }
}

Widget buttonContainer({String text = "All"}){
  return  Container(
    padding: EdgeInsets.only(
        left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    decoration:  BoxDecoration(color: AppColors.primaryElement,borderRadius: BorderRadius.circular(12)),
    child:  text16Widget(text: text, fontWeight: FontWeight.normal, ),
  );
}