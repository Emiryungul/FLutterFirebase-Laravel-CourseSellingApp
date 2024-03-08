import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodapp/common/Widgets/box_shadow.dart';
import 'package:riverpodapp/common/Widgets/text_widgets.dart';

AppBar myAppbar( {required String title}){
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          color: Colors.black38,
          height: 1,
        )
    ),
    centerTitle: true,
    title: text16Widget(text: title, fontWeight: FontWeight.bold, textColor: Colors.black ),
  );
}

Widget thirdPartyLogin(){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 80,vertical: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton(imagePath: "assets/icons/google.png"),
        _loginButton(imagePath: "assets/icons/apple.png"),
        _loginButton(imagePath: "assets/icons/facebook.png"),



      ],
    ),

  );
}

Widget _loginButton({String imagePath = ""}){
  return GestureDetector(
    child:  Container(
      width: 50.w,
      height: 50.h,
      decoration: const BoxDecoration(shape: BoxShape.circle,),
      child: Image.asset(imagePath),
      
    ),
  );
}


Widget appTextField(
    {
      TextEditingController? textEditingController,
      String text = "",
      String iconName = "",
      String hintText = "Type in your info",
      bool obscureText = false,
      void Function(String value)? func
    }) {
  return Container(

    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text16Widget(text: text, fontWeight: FontWeight.normal, textColor: Colors.black38),
        const SizedBox(height: 5,),
        Container(
          width: 325.w,
          height: 40.h,

          decoration: appTextFieldShadowBox(),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //for showing icons
              const SizedBox(width: 5,),
              Image.asset(iconName),

              //our text field
              sizedbox(
                  textEditingController: textEditingController,
                  obscureText: obscureText,
                  hintText: hintText,
                  func: func
              )
            ],
          ),
        )
      ],
    ),
  );
}


Widget sizedbox({
  TextEditingController? textEditingController,
  String text = "",
  String iconName = "",
  String hintText = "Type in your info",
  bool obscureText = false,
  void Function(String value)? func,
   double width = 280,
   double heigth = 50
}){
  return SizedBox(
    width: width.w,
    height: heigth.h,
    child: TextField(
      controller: textEditingController,
      keyboardType: TextInputType.multiline,
      keyboardAppearance: null,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,),

        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //default border without any input
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        //focused border is with input
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      onChanged: (value)=>func!(value),
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
      autofocus: false,
    ),
  );
}

