import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isaacs_app/ui/models/user_model.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends StreamViewModel<List<UserModel>> {

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");


  Stream<List<UserModel>> get getUserList {
    print("getUserList");
    return userCollection.snapshots().map((snapshot) => snapshot.docs
        .map((docSnapshot) => UserModel.fromJson(docSnapshot.data()))
        .toList());

  }

  String _title = "Profile View";
  String get title => '$_title';

  List<UserModel> get users => data;

  @override
  Stream<List<UserModel>> get stream => getUserList;

}