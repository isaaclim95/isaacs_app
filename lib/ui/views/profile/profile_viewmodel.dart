import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isaacs_app/ui/models/user_model.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends StreamViewModel<List<UserModel>> {

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");

  Future getDocs() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
    print(querySnapshot.docs.length);
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print(a.id);
    }
  }


  Stream<List<UserModel>> get getUserList {
    print("getUserList");
    return userCollection.get().asStream().map((snapshot) => snapshot.docs
            .map((docSnapshot) => UserModel.fromJson(docSnapshot.data()))
            .toList());
    // snapshots().map((snapshot) => snapshot.docs
    //     .map((docSnapshot) => UserModel.fromJson(docSnapshot.data()))
    //     .toList());
  }

  String _title = "Profile View";
  String get title => '$_title';

  List<UserModel> get users => data;

  @override
  Stream<List<UserModel>> get stream => getUserList;

}