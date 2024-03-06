import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpodapp/Pages/Application/NavBarPage/NavBarPage.dart';
import 'package:riverpodapp/Pages/Home/home_page.dart';
import 'package:riverpodapp/Pages/Register_page/sign_up_page.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_page.dart';
import 'package:riverpodapp/Pages/Welcome/EntrancePage.dart';
import 'package:riverpodapp/common/routes/app_routes.dart';
import 'package:riverpodapp/global.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: RoutesNames.WELCOME, page:EntrancePage()),
      RouteEntity(path: RoutesNames.SING_IN, page: const SignInPage()),
      RouteEntity(path: RoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: RoutesNames.APPLICATION, page: const NavBarPage()),
      RouteEntity(path: RoutesNames.HOME, page: const HomePage()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print("clicked route is ${settings.name}");
    }
    if(settings.name!=null){

      var result = routes().where((element) => element.path==settings.name);

      if(result.isNotEmpty){
        //if we used this is first time  or not
        bool deviceFirstTime= Global.storageService.getDeviceFirstOpen();

        if(result.first.path==RoutesNames.WELCOME&&deviceFirstTime){

          bool isLoggedIn = Global.storageService.isLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(
                builder: (_) => const NavBarPage(),
                settings: settings);
          }else{
            return MaterialPageRoute(
                builder: (_) => const SignInPage(),
                settings: settings);
          }

        }else{
          if (kDebugMode) {
            print('App ran first time');
          }
          return MaterialPageRoute(
              builder: (_) => result.first.page,
              settings: settings);
        }
      }
    }
    return MaterialPageRoute(
        builder: (_) => EntrancePage(),
        settings: settings);
  }
}


class RouteEntity{
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}