import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Application/NavBarPage/notifier/application_nav_notifier.dart';
import 'package:riverpodapp/Pages/Application/NavBarPage/widgets.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodapp/common/Widgets/box_shadow.dart';

import '../../../common/utils/colors.dart';

class NavBarPage extends ConsumerWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    int index= ref.watch(applicationNavIndexProvider);
    return Scaffold(
      appBar: myAppbar(title: "Pages Start"),
      body: Container(),
      bottomNavigationBar: Container(
        width: 340.w,
        height: 55.h,
        decoration: appShadowBox(color: Colors.black, border: Border()),
        child: BottomNavigationBar(
          items: bottomTabs,
          elevation: 1,
          onTap: (value){
            ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedItemColor: AppColors.primaryElement,
          unselectedItemColor: Colors.black,
        ),
      ),



    );
  }
}

