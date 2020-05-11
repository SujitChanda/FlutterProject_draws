import 'package:flutter/material.dart';

import 'Screens/RegistrationScreen.dart';
import 'Screens/LoginScreen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home:LognScreen()
    );
  }
}