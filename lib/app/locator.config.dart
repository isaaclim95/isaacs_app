// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/authentication_service.dart';
import '../services/email_service.dart';
import '../services/firebase_service.dart';
import '../services/storage_service.dart';
import '../services/third_party_services_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<AuthService>(() => thirdPartyServicesModule.authService);
  gh.lazySingleton<EmailService>(() => thirdPartyServicesModule.emailService);
  gh.lazySingleton<FirebaseService>(
      () => thirdPartyServicesModule.firebaseService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<StorageService>(
      () => thirdPartyServicesModule.storageService);
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  AuthService get authService => AuthService();
  @override
  EmailService get emailService => EmailService();
  @override
  FirebaseService get firebaseService => FirebaseService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  StorageService get storageService => StorageService();
}
