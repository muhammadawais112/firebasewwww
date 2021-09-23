import 'package:flutter/material.dart';

class postq extends StatelessWidget {
  final Map data;

  const postq({required this.data});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 2)),

      child: Column(
          children: [
           
           Image.network(data["url"],
           height: 50,
           width: 50,),
          Text(data["title"]),
          Text(data["description"]),
          
          ],
        ),
      );
      
    
  }
}