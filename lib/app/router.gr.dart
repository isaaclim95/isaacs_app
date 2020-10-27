// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/streamcounter/streamcounter_view.dart';
import '../ui/views/authentication/login_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/profile/profile_view.dart';
import '../ui/views/record/record_view.dart';
import '../ui/views/settings/settings_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupViewRoute = '/';
  static const String homeViewRoute = '/home-view';
  static const String settingsViewRoute = '/settings-view';
  static const String profileViewRoute = '/profile-view';
  static const String recordViewRoute = '/record-view';
  static const String loginViewRoute = '/login-view';
  static const String streamCounterViewRoute = '/stream-counter-view';
  static const String unknownViewRoute = '*';
  static const all = <String>{
    startupViewRoute,
    homeViewRoute,
    settingsViewRoute,
    profileViewRoute,
    recordViewRoute,
    loginViewRoute,
    streamCounterViewRoute,
    unknownViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupViewRoute, page: StartupView),
    RouteDef(Routes.homeViewRoute, page: HomeView),
    RouteDef(Routes.settingsViewRoute, page: SettingsView),
    RouteDef(Routes.profileViewRoute, page: ProfileView),
    RouteDef(Routes.recordViewRoute, page: RecordView),
    RouteDef(Routes.loginViewRoute, page: LoginView),
    RouteDef(Routes.streamCounterViewRoute, page: StreamCounterView),
    RouteDef(Routes.unknownViewRoute, page: StreamCounterView),
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
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
        settings: data,
      );
    },
    RecordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RecordView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    StreamCounterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StreamCounterView(),
        settings: data,
      );
    },
  };
}
