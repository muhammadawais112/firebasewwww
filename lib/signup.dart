// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart';

class  Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController =TextEditingController();
    final TextEditingController emailController =TextEditingController();
    final TextEditingController passwordController =TextEditingController();
     void register() async {
       FirebaseAuth auth = FirebaseAuth.instance;
       FirebaseFirestore db = FirebaseFirestore.instance;
       final String username = usernameController.text;
       final String email = emailController.text;
       final String password =passwordController.text;
       try{
 final   UserCredential user =    await auth.createUserWithEmailAndPassword(email: email,password: password);
      db.collection("user").doc(user.user.uid).set({
         "email":email,
         "username":username,
      });

      Navigator.of(context).pushNamed("/Login");
      // ignore: avoid_print
      print("user is register");

       } catch (e){
       print("error");
     }
     }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(child: 
        Column(children: [
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Enter your username'
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Enter your Email'
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Enter your Password'
            ),
          ),
          ElevatedButton(onPressed: register, child:Text("Register"))
        ],)),
        
      ),
    );
  }
}