import 'dart:convert';

import 'package:riverpodapp/common/entities/entities.dart';
import 'package:shared_preferences/shared_preferences.dart' ;

import '../utils/constants.dart';

class StorageService{
      late final  SharedPreferences ?_pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool?> setString(String key, String value)async{
    return await _pref?.setString(key, value);
  }

  Future<bool?> setBool(String key, bool value) async {
    return await _pref?.setBool(key, value);
  }

  String getString(String key){
    return _pref?.getString(key)??"";
  }
  bool getDeviceFirstOpen(){
    return _pref?.getBool(AppConstants.STORAGE_DEVICE_FIRST_LOGIN_KEY)??false;
  }

  //Eğer uygulamaya girilmiş ise anahtar Null değildir eğer null değilse truedur yada false dur
  bool isLoggedIn(){
    return _pref?.getString(AppConstants.STORAGE_USER_PROFILE_KEY)!=null?true:false;
  }

  UserItem getUserProfile(){
    var profile = _pref?.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";
    var profileJson = jsonDecode(profile);
    var userProfile = UserItem.fromJson(profileJson);
    return userProfile;
    }
  }
