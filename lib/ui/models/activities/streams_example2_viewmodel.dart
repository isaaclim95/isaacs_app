import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/firebase_service.dart';
import 'package:stacked/stacked.dart';

class StreamsExample2ViewModel extends StreamViewModel<List<String>> {
  final FirebaseService _firebaseService = locator<FirebaseService>();

  Future<void> f() async {
    // var convos = _firebaseService.getConvos();
    // print(convos);
  }

  @override
  Stream<List<String>> get stream => _firebaseService.getConvos();

  List<String> get convos => data;
}
