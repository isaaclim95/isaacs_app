import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/firebase_service.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get uid {
    return _auth.currentUser.uid  != null ? _auth.currentUser.uid : 'none';
  }

  bool isSignedIn() {
    var user = _auth.currentUser;
    return user != null;
  }

  Future<bool> signUp(email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);

      return true;
    } catch (e) {
      print("Failed to signUp(): " + e.toString());
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      print("Signed out.");
      return true;
    } catch (e) {
      print("Failed to sign out.");
      print(e);
      return false;
    }
  }

  // TODO: handle exceptions and alert user
  Future<bool> signIn(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email:email, password: password);
      print("Signed in.");
      return true;
    } catch (e) {
      throw e;
    }
  }


}