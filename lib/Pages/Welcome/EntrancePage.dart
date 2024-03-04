import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Welcome/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:riverpodapp/Pages/Welcome/notifier/welcome_notifier.dart';


final indexProvider =StateProvider<int>((ref) => 0);

class EntrancePage extends ConsumerWidget {
   EntrancePage({super.key});


final PageController _controller =PageController();
 int dotsIndex =0;



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index =ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(top: 35),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged:(value){
                    dotsIndex=value;
                    ref.read(indexDotProvider.notifier).state=value;

                },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    pageViewOnboarding(
                        imagePath: "assets/images/reading1.jpg",
                        title: 'baslik1',
                        subtitle: 'harmonies, tints, shades and tones; input Hex color codes, RGB and HSL',
                        index: 1,
                        controller: _controller, context: context),

                    pageViewOnboarding(
                        imagePath: "assets/images/man1.jpg",
                        title: 'baslik2',
                        subtitle: 'Looking for some already great color combinations? Our color chart features',
                        index: 2,
                        controller: _controller, context: context

                    ),

                    pageViewOnboarding(
                        imagePath: "assets/images/3rdimage.jpg",
                        title: 'baslik3', subtitle: 'for a quick reference of all the HTML color names grouped by color.',
                        index: 3,
                        controller: _controller, context: context),
                  ],
                ),
                Positioned(
                  bottom: 190.h,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size:  Size(9.0.w,9.0.w),
                      activeSize:  Size(24.0.w, 9.0.w),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),


                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}


