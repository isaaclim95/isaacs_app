import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if (state == AppLifecycleState.resumed) {
      // User is online
      userCollection.doc("isOnline").update({"isOnline":"true"});
    } else if (state == AppLifecycleState.inactive) {
      // User is offline
      userCollection.doc("isOnline").update({"isOnline":"false"});
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
