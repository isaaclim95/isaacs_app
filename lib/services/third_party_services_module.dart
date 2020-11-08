import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'authentication_service.dart';
import 'email_service.dart';

@module
abstract class ThirdPartyServicesModule  {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  AuthService get authService;

  @lazySingleton
  EmailService get emailService;
}