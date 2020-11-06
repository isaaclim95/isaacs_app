import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isaacs_app/app/locator.dart';
import 'authentication_service.dart';

/// [FirebaseService] Handles all the updating, deleting etc. of documents and collections
class FirebaseService {

  final AuthService _authService = locator<AuthService>();
  bool isSignedIn = false;
  String uid;
  static CollectionReference userCollection;


  FirebaseService() {
    if (_authService.isSignedIn()){
      isSignedIn = true;
      userCollection = FirebaseFirestore.instance?.collection("users");
      uid = _authService.uid;
      print(uid);
    }
  }

  Future<void> updateStatus(isOnline) async {
    userCollection?.doc(uid)?.update({"isOnline":isOnline});
  }

}