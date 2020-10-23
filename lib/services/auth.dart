import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  bool get isSignedIn {
    var user = _auth.currentUser;
    return user != null;
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
}