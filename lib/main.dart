import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main()=>runApp(MaterialApp(
    home: MyHomePage(),
    ));
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _imageurl;
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: Container(
        child:Column(
          children: <Widget>
          [
            SizedBox(height: 64,),
            _imageurl!=null?
            CircleAvatar(
              child: ClipOval(
                child: Image.network(_imageurl),
              ),
              radius: 100,
            ):
            CircleAvatar(
              child: ClipOval(
                child: Icon(Icons.person,size: 100,),
              ),
              radius: 100,
            )    ,
            SizedBox(height: 16,),
            FlatButton(onPressed: ()
            {
              _image=ImagePicker.pickImage(source: ImageSource.gallery);
              
            },
              child: Text('Change Image'),
            )
            
            
            
          ],
        ),
      ),
      
      );
  }
}

