import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'authentication_service.dart';

@module
abstract class ThirdPartyServicsModule  {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  AuthService get authService;
}