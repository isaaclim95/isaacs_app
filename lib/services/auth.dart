import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isSignedIn {
    return _auth.currentUser != null;
  }

  String get uid {
    print(isSignedIn.toString());
    print("Trying to get currentUser");
    print(_auth.currentUser);
    print("successfully got currentUser");
    print("Trying to get uid");
    print(_auth.currentUser.uid);
    print("successfully got uid");
    return _auth.currentUser.uid;
  }


  Future signOut() async {
    try {
      dynamic result = _auth.signOut();

      return result;
    } catch (e) {
      print(e.toString());
      return e.message;
    }
  }

  Future signIn() async {
    try {
      _auth.signInWithEmailAndPassword(email: "isaaclim95@gmail.com", password: "password123");
    } catch (e) {
      print(e);
    }
  }
}