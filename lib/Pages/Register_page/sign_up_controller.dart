import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodapp/Pages/Register_page/notifier/register_notifier.dart';
import 'package:riverpodapp/common/Widgets/toast_messages.dart';
import 'package:riverpodapp/common/global_loader/global_loader.dart';

class SignUpController{
  final  WidgetRef ref;

    SignUpController({required this.ref});

    Future<void> handleSignUp() async {
      var state = ref.read(registerNotifierProvider);

      String name = state.userName;
      String email = state.email;
      String password = state.password;
      String rePassword = state.rePassword;



      if(state.userName.isEmpty||name.isEmpty){
        toastInfo("your name is empty");
      }
      if(state.userName.length<6||name.length<6){
        toastInfo("your name is too short");
      }
      if(state.email.isEmpty||email.isEmpty){
        toastInfo("your name is empty");
      }

      if(state.password!=state.rePassword){
        toastInfo("Your rePassword is not same ");
      }
      // true oldugu zaman yükleme ekranını göster


      ref.read(appLoaderProvider.notifier).setLoaderValue(true);
      Future.delayed(const Duration(seconds: 2),() async {
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: email, password: password
          );
          if (kDebugMode) {
            print(credential);
          }

          if (credential.user != null) {
            await credential.user?.sendEmailVerification();
            await credential.user?.updateDisplayName(name);
            //get server photo url
            //set user photo url

          }
        }on FirebaseAuthException catch(e) {
            if(e.code=='weak-password'){
              toastInfo("Your password is too weak");
            }else if (e.code == 'email-already-in-use') {
              toastInfo('The account already exists for that email.');
            }else if(e.code == 'user-not-found') {
              toastInfo('No user found for that email.');
            }
        }


        // buraya geldiginde ekran yüklemesini durdur
        ref.read(appLoaderProvider.notifier).setLoaderValue(false);

      });




    }
}