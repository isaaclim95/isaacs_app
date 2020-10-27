import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'authentication_service.dart';
import 'epoch_service.dart';

@module
abstract class ThirdPartyServicsModule  {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  EpochService get epochService;

  @lazySingleton
  AuthService get authService;
}