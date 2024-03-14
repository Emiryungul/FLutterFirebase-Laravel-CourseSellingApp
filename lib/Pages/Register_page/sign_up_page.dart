import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Register_page/notifier/register_notifier.dart';
import 'package:riverpodapp/Pages/Register_page/sign_up_controller.dart';
import 'package:riverpodapp/common/global_loader/global_loader.dart';
import 'package:riverpodapp/common/utils/colors.dart';

import '../../common/Widgets/button_widgets.dart';
import '../../common/Widgets/text_widgets.dart';
import '../Sign_in/sign_in_widgets.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}


  class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
  _controller = SignUpController(ref: ref);

  super.initState();
  }

  @override
  Widget build(BuildContext context,) {
    final regProvider = ref.watch(registerNotifierProvider);
    //register elemeanlarını buradan izlicek river pod kodu burda
    final loader = ref.watch(appLoaderProvider);
    // Ekran register olduktan sonra giriceküykleme ekranı true mu false mu anlamak için var
     return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: myAppbar(title: "Register"),
          body: loader == false
              ? SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                 SizedBox(height: 30.h,),

                const Center(child: text16Widget(text: "Enter your required details below ", fontWeight: FontWeight.normal, textColor: Colors.black38,)),

                 SizedBox(height: 50.h,),

                Center(
                  child: appTextField(
                      text: "User Name",
                      hintText: 'Enter your Username Address here',
                      iconName: "assets/icons/user.png",
                      func: (value){
                        ref.read(registerNotifierProvider.notifier).onUserNameChange(value);
                      }
                  ),
                ),

                 SizedBox(height: 10.h,),

                Center(
                  child: appTextField(
                      text: "Email",
                      hintText: 'Enter your Email Address here',
                      iconName: "assets/icons/user.png",
                      func: (value)=>ref.read(registerNotifierProvider.notifier).onUserEmailChange(value)
                  ),
                ),

                 SizedBox(height: 10.h,),

                Center(
                  child: appTextField(
                      text: "Password",
                      hintText: 'Enter your Password Address here',
                      iconName: "assets/icons/lock.png",
                      obscureText: false,
                      func: (value)=>ref.read(registerNotifierProvider.notifier).onUserPasswordChange(value)
                  ),
                ),

                 SizedBox(height: 10.h,),

                Center(
                  child: appTextField(
                      text: "Confirm Password",
                      hintText: 'Confirm your Password here',
                      obscureText: true ,
                      iconName: "assets/icons/lock.png",
                      func: (value)=>ref.read(registerNotifierProvider.notifier).onUserRePasswordChange(value)
                  ),
                ),
                 SizedBox(height: 10.h,),
                Container(
                    margin: const EdgeInsets.only(left: 35),
                    child: textUnderline()
                ),

                SizedBox(height: 20.h,),

                Container(
                    margin: const EdgeInsets.only(left: 5),
                        child: const text16Widget(
                            text: 'You have to agree with our terms & condication '
                                'to login',
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black38,

                        )
                    ),

                 SizedBox(height: 65.h,),
                Center(
                    child: appButton(
                      buttonName: " Register ",
                      context: context,
                      func: ()=>_controller.handleSignUp(),

                    )
                ),



              ],
            ),
          )
              : const Center(
                child: CircularProgressIndicator(
                            backgroundColor: AppColors.primaryElement,
                          ),
              )
        ),
      ),
    );
  }
}


