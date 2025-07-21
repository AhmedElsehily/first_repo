

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Profile());
}
class Profile extends StatelessWidget {
  @override  
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is my profil card", style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor:  Colors.teal,
        ),
        body: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar( 
                  backgroundColor: Colors.teal,
                  radius: 70,
                  child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/my photo.jpg"),
                ),
                ),
                
                SizedBox(height: 9,),
                Text("Ahmed Hussein Elsehily",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,
                ),
                ),
                SizedBox(height: 5,),
                Text("Mobile Using Fultter",style: TextStyle(fontSize: 15),),
                Divider(thickness: 2, 
                ),
                SizedBox(child: Row(
                  children: [
                Spacer(flex: 9,),
                Icon(Icons.email , color: Colors.teal, size: 30,),
                Spacer(flex: 1,),
                Text("aalshyly45@gmail.com", style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(flex: 9,),

                  ],
                ),)
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}


