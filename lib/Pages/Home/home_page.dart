import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_widgets.dart';


import '../../common/Widgets/search_bar_widget.dart';
import 'home_widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: myAppbar(title: "Home Page",),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              helloText(),
              nameText(),
              SizedBox(height: 15.h,),
              searchBar(),
              SizedBox(height: 10.h,),
              bannerWidget(ref: ref)

            ],
          ),
        ),
      ),
    );
  }


}
