import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';

/// file: locator.dart
/// purpose: Hold instances of services to allow files to easily access,
/// and only allow a single instance of each.

/// Assign our instance of our service locator.
final locator = GetIt.instance;

/// Registers each service that is placed in here
@injectableInit
void setupLocator() => $initGetIt(locator);

