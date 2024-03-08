import 'package:flutter/material.dart';

import '../../common/Widgets/text_widgets.dart';
import '../../global.dart';

Widget helloText(){
  return text24Widget(text: "Welcome", fontWeight: FontWeight.bold, textColor: Colors.grey);
}
Widget nameText(){
  return text24Widget(
      text: Global.storageService.getUserProfile().name!,
      fontWeight: FontWeight.bold,
      textColor: Colors.black
  );
}