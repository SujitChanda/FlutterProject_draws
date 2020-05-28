import 'package:flutter/material.dart';
import 'registrationPage.dart';
//import 'HomeScreen.dart';
//import 'RegistrationScreen.dart';



class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body //: user != null
            //? HomeScreen(
            //    user: user,
            //  )
            : RegistrationPage());
  }
}