import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_app/services/auth.dart';
import 'package:isaacs_app/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatefulWidget  {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("users");

  final AuthService _authService = locator<AuthService>();
  String uid;

  @override
  void initState() {
    super.initState();
    _authService.signOut();

    if(!_authService.isSignedIn)  {
      print("Not signed in, Signing in...");
      _authService.signIn();
    } else  {
      print("User " + uid.toString() + " " + "is signed in.");
    }

    uid = _authService.uid;
    print("online");
    userCollection.doc(uid).update({"isOnline":"true"});

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // User is online
      print("online");
      userCollection.doc(uid).update({"isOnline":"true"});
    } else if (state == AppLifecycleState.inactive) {
      // User is offline
      print("offline");
      userCollection.doc(uid).update({"isOnline":"false"});

    } else if(state == AppLifecycleState.detached)  {
      // User is offline
      print("offline");
      userCollection.doc(uid).update({"isOnline":"false"});
    }

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isaac\'s App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartupView(),
      // Allows us to use contextless navigation
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }


}
