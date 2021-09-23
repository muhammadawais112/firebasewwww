// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
class TODO extends StatefulWidget {
 
  

  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  var output ="";
   List<dynamic> li =["1","2","3","4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       appBar: AppBar(
        title: Container(
          
          child: Center(child: Text("TODO APP",style: TextStyle(fontWeight: FontWeight.bold),))),
      ),
      
      body:ListView.builder(
        itemCount:li.length ,
        itemBuilder:(context ,index){
          return Container(
            color:Colors.blue[300],
            margin: EdgeInsets.only(top:10),
            child:ListTile(
              title: Text(li[index]),
              trailing:Expanded(
                child: Container(
                  width: 50,
                  child: Row(children: [ 
                          GestureDetector(
                        onTap: (){
                        
         showDialog(context: context, builder: (context){
           return AlertDialog(
              title: Text("Edit"),
              content: TextField(
                onChanged: (value){
               output=value;    
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                   Navigator.of(context).pop();
                  setState(() {
                  li.replaceRange(index, index+1, {output});
                  });
                }, child: Text("Add"))
              ],
           );
         });
                        },
                        child: Icon(Icons.edit)
                  
                       ),
                       GestureDetector(
                        onTap: (){
                          setState(() {
                            li.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete)
                  
                       )
                        
                  ]),
                ),
              ),
        
          ));}),
        
        
        floatingActionButton:FloatingActionButton(onPressed: (){
         
         showDialog(context: context, builder: (context){
           return AlertDialog(
              title: Text("Add"),
              content: TextField(
                onChanged: (value){
               output=value;    
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                   Navigator.of(context).pop();
                  setState(() {
                    li.add(output);
                  });
                }, child: Text("Add"))
              ],
           );
         });
        },child: Text("Add"),)
      
                   
    
    );
        
  }
}