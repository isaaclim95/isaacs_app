import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/epoch_service.dart';
import 'package:stacked/stacked.dart';

// ViewModel
class StreamCounterViewModel extends StreamViewModel<int> {

  String get title => 'StreamCounterView';
  String get timeData => 'This is the time since epoch in seconds \n $data';

  @override
  Stream<int> get stream => locator<EpochService>().epochUpdatesNumbers();
}