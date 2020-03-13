import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bhatflutter_app/HomeScreen.dart';
void main() => runApp(MaterialApp(
  home: mobLogin(),
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
  final _emailController=TextEditingController();
  final _passController=TextEditingController();
  Future<FirebaseUser> login(String email,String pass) async{
    try
    {
      FirebaseAuth _auth = FirebaseAuth.instance;
      AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user=result.user;
      return user;
    }catch(e) {
      print(e);
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belcome Kindi!'),
      ),
      body: Form(
        child: Column(
          children: <Widget>
          [
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
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                child: Text('Register',style: TextStyle(color: Colors.white),),
                onPressed: ()  async {
                  final email=_emailController.text.toString().trim();
                  final pass=_passController.text.toString().trim();
                  FirebaseUser user=await login(email, pass);
                  if(user!=null)
                    {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(name:user.displayName, imageUrl:user.photoUrl)));

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
      )
    );
  }
}
class mobLogin extends StatelessWidget {
  Future<bool> loginUser()  async{
    FirebaseAuth _auth= FirebaseAuth.instance;
    _auth.verifyPhoneNumber(phoneNumber: null,
        timeout: null,
        verificationCompleted: null,
        verificationFailed: null,
        codeSent: null,
        codeAutoRetrievalTimeout: null);

  }
 final _mobno=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>
                [
                  Text('Login',style: TextStyle(color:Colors.blue,fontSize: 30),),
                  SizedBox(height: 16,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Mobile number',
                    ),
                    controller: _mobno,
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: FlatButton(onPressed: (){},child: Text('Login',style: TextStyle(color: Colors.white),),color: Colors.blue,),

                  )

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}


