import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authenticate with ChangeNotifier{
  bool loginTrue = true;
  bool loading = false;
  String? errorMessage;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp(String username, String email, String password) async {
    loading = true;
    notifyListeners();
    try{
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) async {
        User user = _auth.currentUser!;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set({
          'uid': user.uid,
          'email': user.email,
          'username': username,
        });
      });
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
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }  on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      if (error.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for the given email!');
        }
      } else {
        if (kDebugMode) {
          print(error.toString());
        }
      }
      Fluttertoast.showToast(msg: errorMessage!);
      if (kDebugMode) {
        print(error.code);
      }
    }
    loading = false;
    notifyListeners();
  }

  signOut() async {
    _auth.signOut();
  }
}