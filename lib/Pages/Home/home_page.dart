import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_widgets.dart';


import '../../common/Widgets/search_bar_widget.dart';
import 'controller/home_controller.dart';
import 'home_widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  late PageController _controller ;
  @override
  void didChangeDependencies() {
    _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:homeAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const helloText(),
              const nameText(),
              SizedBox(height: 15.h,),
              searchBar(),
              SizedBox(height: 10.h,),
              BannerWidget(ref: ref,controller: _controller),
              const HomeMenuBar(),
              const CourseItemGrid()

            ],
          ),
        ),
      ),
    );
  }
}
