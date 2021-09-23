// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:kk/signup.dart';





class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =TextEditingController();
    final TextEditingController passwordController =TextEditingController(

    );
     void Login() async {
       FirebaseAuth auth = FirebaseAuth.instance;
       FirebaseFirestore db = FirebaseFirestore.instance;
      
       final String email = emailController.text;
       final String password =passwordController.text;



      try {
final UserCredential user = await  auth.signInWithEmailAndPassword(email: email, password: password);
 final DocumentSnapshot snapshot = await db.collection("users").doc(user.user.uid).get();
 final data = snapshot.data();
       
       Navigator.of(context).pushNamed("/home");

     } 
     
   on FirebaseException catch (e) {

    print("error");
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Text(e.message),
      );
    });
    
  }
    

     }
    return Scaffold(
      appBar: AppBar(
        title: Container(
          
          child: Center(child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold),))),
      ),
      
      body: SingleChildScrollView(
        child: Stack(children:[
        
          Container(
            height: 650,
            width:650,
            
            child: Image.network("https://images.unsplash.com/photo-1632218627949-f9b23c53218a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=415&q=80",fit: BoxFit.fill,
            
            ),
          
          ),
           Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SafeArea(child: 
            Column(children:[
              Container(
                margin: EdgeInsets.only(top: 130),
                child: TextFormField(
                  
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your Email',
                  labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                   hintStyle:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                
                ),
              ),
              Container(
                 margin: EdgeInsets.only(top: 100),
                child: TextFormField(
                  
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Enter your Password',
                    labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                
                    hintStyle:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: Login, child:Text("LOGIN")),
              
           SizedBox(height: 5,),
              GestureDetector( onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Register();
              }));
              },child: Text("Create New Account?",style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,
              ),))
            ],),
            
            ),
            ),
          ]  ),
      ),
    );
  }
}