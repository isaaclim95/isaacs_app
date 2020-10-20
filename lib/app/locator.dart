import 'package:get_it/get_it.dart';
import 'package:isaacs_app/ui/views/profile/profile_viewmodel.dart';
import 'package:isaacs_app/ui/views/startup/startup_button_viewmodel.dart';
import 'package:isaacs_app/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => StartupButtonViewModel());
  locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => ProfileViewModel());
}