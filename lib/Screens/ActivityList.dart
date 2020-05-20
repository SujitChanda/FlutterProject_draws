import 'package:flutter/material.dart';

class ActivityList extends StatefulWidget {
  ActivityList({Key key}) : super(key: key);

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Activity List'),
       ),
       
    );
  }
}