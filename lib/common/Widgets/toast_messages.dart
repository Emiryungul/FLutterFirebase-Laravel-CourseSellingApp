import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo([String msg=""]){
  return Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: 10,
      backgroundColor: Colors.blue,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,

  );
}