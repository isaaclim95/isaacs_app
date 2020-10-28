import 'package:auto_route/auto_route_annotations.dart';
import 'package:isaacs_app/ui/streamcounter/streamcounter_view.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';

/// This does the work we would have to do manually in onGenerateRoute()
/// in main.dart.
@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: StartupView, initial: true, name: 'startupViewRoute'),
    MaterialRoute(page: HomeView, name: 'homeViewRoute'),
    MaterialRoute(page: SettingsView, name: 'settingsViewRoute'),
    MaterialRoute(page: ProfileView, name: 'profileViewRoute'),
    MaterialRoute(page: DynamicListView, name: 'dynamicListViewRoute'),
    MaterialRoute(page: LoginView, name: 'loginViewRoute'),
    MaterialRoute(page: StreamCounterView, name: 'streamCounterViewRoute'),
    MaterialRoute(path: "*", page: StreamCounterView, name: 'unknownViewRoute')
  ]
)
class $Router {}
