import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isaacs_app/ui/models/user_model.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {

  ProfileViewModel()  {
    getUserList();
  }

  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  Stream<List<UserModel>> getUserList() {
    var lst = _fireStoreDataBase.collection('user')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => UserModel.fromJson(document.data()))
        .toList());
    print(lst);
    return lst;
  }

  String _title = "Profile View";

  String get title => '$_title';

}