import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

/// file: locator.dart
/// purpose: Hold instances of services to allow files to easily access,
/// and only allow a single instance of each.

/// Assign our instance of our service locator.
final locator = GetIt.instance;

/// Registers each service that is placed in here
Future setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
}