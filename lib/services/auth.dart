import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Authenticate with ChangeNotifier{
  bool loginTrue = true;
  bool loading = false;

  Future signUp(String email, String password) async {
    loading = true;
    notifyListeners();
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      } else {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
    loading = false;
    notifyListeners();
  }

  Future signIn(String email, String password) async {
    loading = true;
    notifyListeners();
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for the given email!');
        }
      } else {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
    loading = false;
    notifyListeners();
  }
}