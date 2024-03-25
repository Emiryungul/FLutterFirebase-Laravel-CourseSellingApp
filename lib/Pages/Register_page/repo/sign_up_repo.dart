import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/entities/user.dart';
import '../../../common/utils/http.dart';

class SignUpRep{

  static Future<UserCredential> firebaseSignUp(String email, String password) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }
}