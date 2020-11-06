import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart' hide Router;
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:isaacs_app/services/firebase_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/locator.dart';
import 'app/router.gr.dart';
import 'package:flutter/material.dart' hide Router;
import 'dart:io';
import 'package:isaacs_app/constants/globals.dart' as globals;

final materialThemeData = ThemeData(
  appBarTheme: AppBarTheme(centerTitle: true),
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
);
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String uid;
  bool isOnline;
  final FirebaseService _firebaseService = locator<FirebaseService>();
  final AuthService _authService = locator<AuthService>();

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      globals.isAndroid = true;
    } else if (Platform.isIOS) {
      globals.isAndroid = false;
    } else {
      throw "ERROR WITH PLATFORM";
    }
    isOnline = true;
    _firebaseService.updateStatus(isOnline);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_authService.isSignedIn() == true) {
        // User is online
        print("online");
        isOnline = true;
        _firebaseService.updateStatus(isOnline);
      }
    } else if (state == AppLifecycleState.inactive) {
      if(_authService.isSignedIn() == true) {
        isOnline = false;
        _firebaseService.updateStatus(isOnline);
        print("offline");
      }
    } else if(state == AppLifecycleState.detached)  {
      if(_authService.isSignedIn() == true)  {
        isOnline = false;
        _firebaseService.updateStatus(isOnline);
        print("offline");
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Isaac\'s App',
      debugShowCheckedModeBanner: false,
      material: (_, __) => MaterialAppData(theme: materialThemeData),
      cupertino: (_, __) => CupertinoAppData(theme: cupertinoTheme),

      // Our home view (a Widget).
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router(),

      // Allows us to use context-less navigation
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
