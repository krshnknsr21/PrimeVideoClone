import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class PrimeVideoUser with ChangeNotifier{

  late String _uid;
  User user = FirebaseAuth.instance.currentUser!;

  void addUser() {
    if (kDebugMode) {
      print("User Logged in");
    }
    notifyListeners();
  }

  void setUID() {
    _uid = user.uid;
    if (kDebugMode) {
      print("User ID has been set.");
    }
  }
}