import 'package:firebase_core/firebase_core.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/locator.dart';
import 'app/router.gr.dart';
import 'package:flutter/material.dart' hide Router;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());

}

class MyApp extends StatefulWidget  {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  String uid;
  bool isOnline;

  @override
  void initState() {
    super.initState();
    // isOnline = true;
    // _authService.updateStatus(isOnline);
    // WidgetsBinding.instance.addObserver(this);
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     if (_authService.isSignedIn() == true) {
  //       // User is online
  //       print("online");
  //       isOnline = true;
  //       _authService.updateStatus(isOnline);
  //     }
  //   } else if (state == AppLifecycleState.inactive) {
  //     if(_authService.isSignedIn() == true) {
  //       isOnline = false;
  //       _authService.updateStatus(isOnline);
  //       print("offline");
  //     }
  //   } else if(state == AppLifecycleState.detached)  {
  //     if(_authService.isSignedIn() == true)  {
  //       isOnline = false;
  //       _authService.updateStatus(isOnline);
  //       print("offline");
  //     }
  //   }
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isaac\'s App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Our home view (a Widget).
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router(),

      // Allows us to use context-less navigation
      navigatorKey: locator<NavigationService>().navigatorKey,

    );
  }


}
