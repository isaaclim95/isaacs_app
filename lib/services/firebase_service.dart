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

  Future<bool> signUp(email, password) async {
    try {
      await _authService.signUp(email, password);
      print('signed up');
      Map<String, dynamic> dict = {};
      dict.addAll({'id' : _authService.uid, 'name' : 'isaac', 'age' : 15, 'weight' : 50, 'height' : 179, 'isOnline' : true});
      await userCollection.doc(_authService.uid).set(dict);
      print('added doc');
      return true;
    } catch (e) {
      print('FirebaseService: [$e]');
      return false;
    }



    // await userCollection?.doc(uid)?.update({"age" : 15});
    // await userCollection.
  }

  Future<void> updateStatus(isOnline) async {
    userCollection?.doc(_authService.uid)?.update({"isOnline":isOnline});
  }


}