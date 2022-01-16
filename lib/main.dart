import 'package:flutter/material.dart';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseOptions get firebaseOptions => const FirebaseOptions(
      appId: '1:242862654032:android:d96f5602019f871d6fc755',
      apiKey: 'AIzaSyBf6_jJMN18fOBLlyFwsDErwmrpyu4WTqo',
      projectId: 'firestore-b36b7',
      messagingSenderId: '448618578101',
    );

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: firebaseOptions,
  );
  print('Initialized default app $app');
}

Future<void> main() async {
  await initializeDefault();
  //await initializeDefault();
  ///await Firebase.initializeApp();
   WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FireStore",
      home: Scaffold(
        appBar: AppBar(
          title: Text("FireStore"),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _create() async {
    try {
      print("Inner Create");
      await firestore.collection('user1').doc('user2').set({
        'title': 'customer',
        'name': 'Anisur Rahman',
        'email': 'anis@gmail.com',
        'address': 'bagerhat',
        'phone': '01795100243',
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RaisedButton(
          child: Text(
            "Create",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () async {
            await _create();
            setState(() {
              print("Successfully Created");
            });
          },
        ),
        SizedBox(height: 20),
        RaisedButton(
          child: Text(
            "Read",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {},
        ),
        SizedBox(height: 20),
        RaisedButton(
          child: Text(
            "Update",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {},
        ),
        SizedBox(height: 20),
        RaisedButton(
          child: Text(
            "Delete",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
