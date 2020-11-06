import 'package:isaacs_app/services/firebase_service.dart';
import 'package:isaacs_app/ui/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:isaacs_app/app/locator.dart';

class StreamsExampleViewModel extends StreamViewModel<List<UserModel>> {

  final FirebaseService _firebaseService = locator<FirebaseService>();

  List<UserModel> get users => data;

  @override
  Stream<List<UserModel>> get stream => _firebaseService.getUserList;

}