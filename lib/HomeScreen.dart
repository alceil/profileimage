import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  final  name;
  final  imageUrl;
  final user;
  HomeScreen({this.name,this.imageUrl,this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            Text('You are logged in succesfully',style: TextStyle(color: Colors.black,fontSize: 40),),
            SizedBox(height: 16,),
            Text('Your Name is $name',style: TextStyle(color: Colors.yellow,fontSize: 20),),
            Text('$imageUrl',style: TextStyle(color: Colors.blueGrey),),

          ],
        )
      ),
    );
  }
}
