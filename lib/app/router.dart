import 'package:auto_route/auto_route_annotations.dart';
import 'package:isaacs_app/ui/views/activities/activities_view.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';
import 'package:isaacs_app/ui/views/record/dynamic_list_view.dart';
import 'package:isaacs_app/ui/views/settings/settings_view.dart';
import 'package:isaacs_app/ui/views/startup/startup_view.dart';

/// Declare AutoRoutes, then run build_runner generator on them (flutter packages pub run build_runner watch --delete-conflicting-outputs).
///
/// Allows us to navigate to our declared routes throughout our program
///
/// This does the work we would have to do manually in onGenerateRoute()
/// in main.dart.
@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: StartupView, initial: true, name: 'startupViewRoute'),
    MaterialRoute(page: HomeView, name: 'homeViewRoute'),
    MaterialRoute(page: ActivitiesView, name:'activitiesViewRoute'),
    MaterialRoute(page: SettingsView, name: 'settingsViewRoute'),
    MaterialRoute(page: ProfileView, name: 'profileViewRoute'),
    MaterialRoute(page: DynamicListView, name: 'dynamicListViewRoute'),
    MaterialRoute(page: LoginView, name: 'loginViewRoute'),
    MaterialRoute(path: "*", page: HomeView, name: 'unknownViewRoute')
  ]
)
class $Router {}
