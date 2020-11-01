// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/authentication_service.dart';
import '../services/third_party_services_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicsModule = _$ThirdPartyServicsModule();
  gh.lazySingleton<AuthService>(() => thirdPartyServicsModule.authService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicsModule.navigationService);
  return get;
}

class _$ThirdPartyServicsModule extends ThirdPartyServicsModule {
  @override
  AuthService get authService => AuthService();
  @override
  NavigationService get navigationService => NavigationService();
}
