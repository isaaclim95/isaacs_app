import 'package:auto_route/auto_route_annotations.dart';
import 'package:isaacs_app/ui/views/activities/activities_view.dart';
import 'package:isaacs_app/ui/views/activities/dynamic_list_view.dart';
import 'package:isaacs_app/ui/views/activities/email_example_view.dart';
import 'package:isaacs_app/ui/views/activities/sharing_view.dart';
import 'package:isaacs_app/ui/views/activities/streams_example_view.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/authentication/register_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:isaacs_app/ui/views/home/homeion/register_view.dart';
import 'package:isaacs_app/ui/views/settings/settings_view.dart';
import 'package:isaacs_app/ui/views/startup/startup_view.dart';

/// Allows us to navigate to our declared routes throughout our program
///
/// Declare AutoRoutes, then run build_runner generator on them (flutter packages pub run build_runner watch --delete-conflicting-outputs).
///
/// This does the work we would have to do manually in onGenerateRoute()
/// in main.dart.
@MaterialAutoRouter(routes: [
  MaterialRoute(page: StartupView, initial: true, name: 'startupViewRoute'),
  MaterialRoute(page: HomeView, name: 'homeViewRoute'),
  MaterialRoute(page: ActivitiesView, name: 'activitiesViewRoute'),
  MaterialRoute(page: SettingsView, name: 'settingsViewRoute'),
  MaterialRoute(page: StreamsExampleView, name: 'streamsExampleViewRoute'),
  MaterialRoute(page: DynamicListView, name: 'dynamicListViewRoute'),
  MaterialRoute(page: LoginView, name: 'loginViewRoute'),
  MaterialRoute(page: SharingView, name: 'sharingViewRoute'),
  MaterialRoute(page: RegisterView, name: 'registerViewRoute'),
  MaterialRoute(page: EmailExampleView, name: 'emailExampleViewRoute'),
  MaterialRoute(page: StorageExampleView, name: 'storageExampleViewRoute'),
  MaterialRoute(path: "*", page: HomeView, name: 'unknownViewRoute')
])
class $Router {}
