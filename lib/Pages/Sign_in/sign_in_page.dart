import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_controller.dart';
import 'package:riverpodapp/Pages/Sign_in/notifier/sign_in_notifier.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_widgets.dart';
import 'package:riverpodapp/common/Widgets/button_widgets.dart';
import 'package:riverpodapp/common/Widgets/text_widgets.dart';
import 'package:riverpodapp/common/global_loader/global_loader.dart';

import '../../common/utils/colors.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}


class _SignInPageState extends ConsumerState<SignInPage> {
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController(ref);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(signInProvider.email);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: myAppbar(title: 'Login'),
          body: loader==false
          ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                thirdPartyLogin(),
                //SizedBox(height: 5,),
                Center(child: text16Widget(text: "Or use your email to login", fontWeight: FontWeight.normal, textColor: Colors.black38,)),

                 SizedBox(height: 50.h,),

                Center(
                  child: appTextField(
                      textEditingController: _controller.emailController,
                      text: "Email",
                      hintText: 'Enter your Email Address here',
                      iconName: "assets/icons/user.png",
                      func: (value){
                        ref.read(signInNotifierProvider.notifier).onUserEmailChange(value);
                      }
                  ),
                ),
                 SizedBox(height: 30.h,),

                Center(
                  child: appTextField(
                      textEditingController: _controller.passwordController,
                      text: "Password",
                      hintText: 'Enter your Password here',
                      obscureText: true ,
                      iconName: "assets/icons/lock.png",
                      func: (value){
                        ref.read(signInNotifierProvider.notifier).onUserPasswordChange(value);
                      }
                  ),
                ),
                 SizedBox(height: 10.h,),
                Container(
                    margin: const EdgeInsets.only(left: 35),
                    child: textUnderline()),
                 SizedBox(height: 90.h,),
                //Button burada
                Center(
                    child: appButton(
                      buttonName: " Log In ",
                      func: (){
                        _controller.handleSignIn();
                      }

                    )
                ),
                 SizedBox(height: 30.h,),
                Center(
                    child: appButton(
                        buttonName: " Register ",
                        isLogin: false,
                        context: context,
                      func: (){
                          Navigator.pushNamed(context, "/register");
                      }
                    )
                )


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
