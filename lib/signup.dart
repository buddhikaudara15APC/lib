import 'package:flutter/material.dart';

import 'api.dart';


class SignUpPage extends StatefulWidget{
  SignUpPage({Key key}) : super(key:key);

  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  bool isSignIn = false;
  var _user = '';
  UserModel user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget _signUpPage() {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('SignUp')),
      body: Container(
       padding: EdgeInsets.all(35.0),
       child: Column(
         children: <Widget>[
           TextField(
             controller: nameController,
           ),
           TextField(
             controller: emailController,
           ),
           TextField(
             controller: passwordController,
           ),
           SizedBox(height: 30.0),
           _user == null
           ? Container(
             child: Text('SignUp Failed'),
           ) 
           :Container(),
           RaisedButton(
             onPressed: () async {
               final String userName = nameController.text;
               final String email = emailController.text;
               final String password = passwordController.text;

          user = await signUpUser(userName,email,password);

          print(user);
          if(user == null){
            setState(() {
              _user = null;
            });
          }else {
            String userName1 = user.userName;
            _user = '' ;
            // is SignIn = true;
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SignUpHome(
            //       userName:userName1,
            //     )));
          }
             },
             child: Text('Sign Up'),
           ) 
         ],
       )),
    );
  }

 @override
 Widget build (BuildContext context) {
   return _signUpPage();
 }
}