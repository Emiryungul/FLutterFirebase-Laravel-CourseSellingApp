import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/common/utils/app_styles.dart';
import 'package:riverpodapp/common/utils/http.dart';
import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();


  runApp(const ProviderScope(child: MyApp()));
}
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navKey,
            title: 'Flutter Demo',
            theme: Apptheme.appThemeData,
            //initialRoute: "/",
            onGenerateRoute: AppPages.generateRouteSettings,
      
          )),
    );
  }
}
