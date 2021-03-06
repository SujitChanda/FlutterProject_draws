import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:simple_animations/simple_animations.dart';

class successPage extends StatefulWidget {
  @override

  _successPageState createState() => _successPageState();
}

class _successPageState extends State<successPage> {

  String _animationName = "Success Check";

  @override
  void initState() {
    super.initState();
    setState(() {
      _animationName = "Success Check";
    });


  }



  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Success ")
         ),
         body:Container(
           padding: EdgeInsets.all(32.0),
           child: Center(
             child: Column(
                 children: <Widget>[
                   Expanded(child:
                   FlareActor(
                     "assets/Success Check.flr",
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     animation: _animationName,
                     ),
                   )
                 ],
             
               ),
           ),
         )
       )
    );
      
  
  }
}

class BlueBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 150),
      builder: (context, animation) {
        return Container(
          height: animation,
          width: double.infinity,
          color: Colors.blue,
        );
      },
    );
  }
}

class CircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2).round()),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, scaleValue) {
        return Positioned(
          top: 100,
          left: size.width / 2 - 50,
          child: Transform.scale(
            scale: scaleValue,
            alignment: Alignment.center,
            child: blueCircle(),
          ),
        );
      },
    );
  }

  Widget blueCircle() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.blue.shade700,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          largeWhitespace(),
          titlePlaceholder(),
          smallWhitespace(),
          contentPlaceHolder(),
        ],
      ),
    );
  }

  Widget titlePlaceholder() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 2.5).round()),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacityValue) {
        return Opacity(
          opacity: opacityValue,
          child: placeholderBox(28, 150, Alignment.centerLeft),
        );
      },
    );
  }

  Widget contentPlaceHolder() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: (300 * 3).round()),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacityValue) {
        return Opacity(
          opacity: opacityValue,
          child: placeholderBox(250, double.infinity, Alignment.centerLeft),
        );
      },
    );
  }

  Widget largeWhitespace() => SizedBox(height: 60);

  Widget smallWhitespace() => SizedBox(height: 8);

  Widget placeholderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
