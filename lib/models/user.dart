import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class PrimeVideoUser with ChangeNotifier{

  late String _uid;
  late String _email;
  late String _userName;

  String get getUsername => _userName;
  String get getUserID => _uid;
  String get getUserEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void setDetails() {
    User user = _auth.currentUser!;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
          _uid = user.uid;
          _email = user.email!;
          _userName = value.data()!['username'];
          if (kDebugMode) {
            print(_uid);
            print(_email);
            print(_userName);
          }
      }
    );
    notifyListeners();
  }
}