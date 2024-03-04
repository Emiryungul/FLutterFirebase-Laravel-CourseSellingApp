import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Application/NavBarPage/NavBarPage.dart';
import 'package:riverpodapp/Pages/Register_page/sign_up_page.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_page.dart';
import 'package:riverpodapp/Pages/Welcome/EntrancePage.dart';
import 'package:riverpodapp/common/utils/app_styles.dart';
import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}
var routesMap= {
  "/":(context)=>EntrancePage(),
  "/signIn":(context)=>const SignInPage(),
  "/register":(context)=>const SignUp(),
  "/application":(context)=>const NavBarPage()
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Apptheme.appThemeData,
            //initialRoute: "/",
            onGenerateRoute: AppPages.generateRouteSettings,
      
          )),
    );
  }
}
