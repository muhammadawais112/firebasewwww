// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kk/post1.dart';
import 'package:kk/signup.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';
import 'login.dart';

void main(){
    WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home:post1(),
            routes: {
              "/Login":(context) => Login(),
              "/Register":(context)=>Register(),
              "/home":(context)=>TODO()           },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
