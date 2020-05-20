import 'package:flutter/material.dart';

class userProfile extends StatefulWidget {
  userProfile({Key key}) : super(key: key);

  @override
  _userProfileState createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      );
  }
}