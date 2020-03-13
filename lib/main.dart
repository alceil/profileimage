import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));
class HomePage extends StatelessWidget {
  final _emailController=TextEditingController();
  final _passController=TextEditingController();
  final _nameController=TextEditingController();
  final _imageController=TextEditingController();
  Future<bool> registerUser(String email,String password,String name,String url) async
  {
    FirebaseAuth _auth=FirebaseAuth.instance;
    try
    {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      UserUpdateInfo info = UserUpdateInfo();
      info.displayName =name;
      info.photoUrl=url;
      user.updateProfile(info);
      return true;
    }
    catch(e)
    {
      print(e);
      return  false;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email'
                  ),
                  controller: _emailController,
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                  controller: _passController,
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Display Name'
                  ),
                  controller: _nameController,
                ),SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Photo Url'
                  ),
                  controller: _imageController,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Register',style: TextStyle(color: Colors.white),),
                    onPressed: () async {
                    final email=_emailController.text.toString().trim();
                    final pass=_passController.text.toString().trim();
                    final name=_nameController.text.toString().trim();
                    final url=_imageController.text.toString().trim();
                    bool result=await registerUser(email, pass, name, url);
                    if(result){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }
                    else
                      {
                      print('error');
                      }
                    },
                  ),
                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belcome Kindi!'),
      ),
      body: Center(child: Text('Belcome lil kindi 😁'),),
    )
  }
}



