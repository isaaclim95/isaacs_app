import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isSignedIn() async {
    var user = _auth.currentUser;
    return user != null;
  }

  String get uid => _auth.currentUser.uid;

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

  Future<bool> signIn(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email:email, password: password);
      print("Signed in.");
      return true;
    } catch (e) {
      print("Failed to sign in.");
      print(e);
      return false;
    }
  }
}