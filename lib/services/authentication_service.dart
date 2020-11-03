import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");

  String get uid => _auth.currentUser.uid;

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

  Future<bool> signIn(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email:email, password: password);
      print("Signed in.");
      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateStatus(isOnline) async {
    userCollection.doc(uid).update({"isOnline":"true"});
  }
}