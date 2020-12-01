import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'authentication_service.dart';
import 'email_service.dart';
import 'firebase_service.dart';
import 'storage_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  AuthService get authService;

  @lazySingleton
  FirebaseService get firebaseService;

  @lazySingleton
  EmailService get emailService;

  @lazySingleton
  StorageService get storageService;
}
