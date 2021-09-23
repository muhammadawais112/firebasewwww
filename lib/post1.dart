// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, avoid_print, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:kk/post.dart';
import 'package:kk/signup.dart';

class post1 extends StatelessWidget {
 final   Stream<QuerySnapshot> postStream = FirebaseFirestore.instance.collection('posts').snapshots();
  

  @override
  Widget build(BuildContext context) {
    return
 Scaffold(
    
      
      body:Expanded(
        child: Column(
          children: [
            StreamBuilder(
        stream: postStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
      
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
      
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      
              return postq(data:data);
      
            
            }).toList(),
          );
          
        })
          ]),
      )
 );
  }
}