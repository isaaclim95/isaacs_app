import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/ui/models/user_model.dart';
import 'authentication_service.dart';

/// [FirebaseService] Handles all the updating, deleting etc. of documents and collections
///
/// Declare an instance as: final FirebaseService _firebaseService = locator<FirebaseService>();
class FirebaseService {

  final AuthService _authService = locator<AuthService>();
  bool isSignedIn = false;

  CollectionReference userCollection = FirebaseFirestore.instance?.collection("users");


  FirebaseService() {
    if (_authService.isSignedIn()){
      isSignedIn = true;
    }
  }



  Stream<List<UserModel>> get getUserList {
    return userCollection?.snapshots()?.map((snapshot) => snapshot.docs
        .map((docSnapshot) => UserModel.fromJson(docSnapshot.data()))
        .toList());
  }

  Future<bool> register(email, password) async {
    try {

      await _authService.createUserWithEmailAndPassword(email, password);
      print('Created new user with id: ' + _authService.uid);

      Map<String, dynamic> dict = {};
      dict.addAll({'id' : _authService.uid, 'name' : 'isaac', 'age' : 15, 'weight' : 50, 'height' : 179, 'isOnline' : true});
      addField(userCollection, dict);

      await userCollection.doc(_authService.uid).set(dict);
      print('Added data to Firestore.');
      return true;
    } catch (e) {
      print('FirebaseService: [$e]');
      return false;
    }
  }

  /// Given a [CollectionReference] and Map of data, set the field in at the reference path
  Future<bool> addField(CollectionReference documentRef, Map<String, dynamic> data) async {
    try {
      await userCollection.doc(_authService.uid).set(data);
      print("added field: " + data.toString());
      return true;
    } catch (e) {
      print('FirebaseService: [$e]');
      return false;
    }
  }

  Future<void> updateStatus(isOnline) async {
    userCollection?.doc(_authService.uid)?.update({"isOnline":isOnline});
  }


}