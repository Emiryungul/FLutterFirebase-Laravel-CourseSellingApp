import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpodapp/Pages/Sign_in/sign_in_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "Home Page",),
    );
  }
}
