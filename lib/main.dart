import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_project/homepage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fpApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'smart home ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _fpApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('FutureBuilder error' + snapshot.error.toString());
            return Text('something wrong');
          } else if (snapshot.hasData) {
            return Home();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
