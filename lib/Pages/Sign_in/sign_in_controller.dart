import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodapp/Pages/Sign_in/notifier/sign_in_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpodapp/common/entities/entities.dart';
import 'package:riverpodapp/common/global_loader/global_loader.dart';
import '../../common/Widgets/toast_messages.dart';
import '../../common/utils/constants.dart';
import '../../global.dart';

class SignInController {

  WidgetRef ref;

  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;


    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);


      if(credential.user==null){
        toastInfo("User not found");
        return;
      }

      if(!credential.user!.emailVerified){
        toastInfo("You must verify your email address first !");
        return;
      }
      var user = credential.user;

      if(user!=null){

        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;


        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity. open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);

        if (kDebugMode) {
          print("user logged in");
        }
      }else{
        toastInfo("login error");
      }
    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        toastInfo("User not found");
      }else if(e.code=='wrong-password'){
        String error = "your password is wrong";
        toastInfo(error);
      }


    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity){

    //have local storage
    try{
      var navigator = Navigator.of(ref.context);
      //try to remember user info
      Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, "123");
      Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");

       navigator.pushNamedAndRemoveUntil("/navbar", (route) => false);

    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }

    //redirect to new page
  }


}