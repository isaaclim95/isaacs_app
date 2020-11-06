// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/views/activities/activities_view.dart';
import '../ui/views/activities/dynamic_list_view.dart';
import '../ui/views/activities/email_example_view.dart';
import '../ui/views/activities/sharing_view.dart';
import '../ui/views/activities/streams_example_view.dart';
import '../ui/views/authentication/login_view.dart';
import '../ui/views/authentication/register_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/settings/settings_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupViewRoute = '/';
  static const String homeViewRoute = '/home-view';
  static const String activitiesViewRoute = '/activities-view';
  static const String settingsViewRoute = '/settings-view';
  static const String streamsExampleViewRoute = '/streams-example-view';
  static const String dynamicListViewRoute = '/dynamic-list-view';
  static const String loginViewRoute = '/login-view';
  static const String sharingViewRoute = '/sharing-view';
  static const String registerViewRoute = '/register-view';
  static const String emailExampleViewRoute = '/email-example-view';
  static const String unknownViewRoute = '*';
  static const all = <String>{
    startupViewRoute,
    homeViewRoute,
    activitiesViewRoute,
    settingsViewRoute,
    streamsExampleViewRoute,
    dynamicListViewRoute,
    loginViewRoute,
    sharingViewRoute,
    registerViewRoute,
    emailExampleViewRoute,
    unknownViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupViewRoute, page: StartupView),
    RouteDef(Routes.homeViewRoute, page: HomeView),
    RouteDef(Routes.activitiesViewRoute, page: ActivitiesView),
    RouteDef(Routes.settingsViewRoute, page: SettingsView),
    RouteDef(Routes.streamsExampleViewRoute, page: StreamsExampleView),
    RouteDef(Routes.dynamicListViewRoute, page: DynamicListView),
    RouteDef(Routes.loginViewRoute, page: LoginView),
    RouteDef(Routes.sharingViewRoute, page: SharingView),
    RouteDef(Routes.registerViewRoute, page: RegisterView),
    RouteDef(Routes.emailExampleViewRoute, page: EmailExampleView),
    RouteDef(Routes.unknownViewRoute, page: HomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ActivitiesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ActivitiesView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
    StreamsExampleView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StreamsExampleView(),
        settings: data,
      );
    },
    DynamicListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DynamicListView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SharingView: (data) {
      final args = data.getArgs<SharingViewArguments>(
        orElse: () => SharingViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SharingView(key: args.key),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );
    },
    EmailExampleView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EmailExampleView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SharingView arguments holder class
class SharingViewArguments {
  final Key key;
  SharingViewArguments({this.key});
}
