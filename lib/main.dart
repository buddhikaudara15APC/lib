import 'package:flutter/material.dart';
import 'package:flutter_buddhika/signup.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
    
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpPage());
  }
}