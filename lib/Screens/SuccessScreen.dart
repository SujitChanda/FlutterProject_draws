import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:intl/intl.dart';




 String _animationName = "Success Check";
 var now = new DateTime.now();

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   home: Scaffold(
      body:new SingleChildScrollView(
        child: Column(
        children: <Widget>[
          topBar(),
          HomePageContent(),
        ],
      ),
      )
    ),
    );
  }


  SizedBox topBar() {
    return SizedBox(
      height: 150,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          BlueBar(),
          CircleAvatar(),
        ],
      ),
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
          padding: EdgeInsets.only(bottom:0.0),
          child: Center(
            child:Text("Login Successful ",style: TextStyle(fontSize: 30, color:Colors.white,fontWeight: FontWeight.w500),),
          ),
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
            child: logoCircle(),
          ),
        );
      },
    );
  }

  Widget logoCircle() {
    return Container(
      height: 100,
      width: 100,
      child: Image.asset("assets/logo1.jpg",fit: BoxFit.contain,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        //color: Colors.blue.shade700,
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
          child:Container(
        height: 35,
        width:MediaQuery. of(context). size. width,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          
          color: Colors.grey.shade300,  
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:10,right:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text("Sujit Chanda", style: TextStyle(fontSize: 20)),
                     Text(new DateFormat("dd-MM-yyyy | hh:mm:ss").format(now)),
                     
                   ],
               
                 ),
        ),
      ),
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
          child: placeholderBox(300, double.infinity, Alignment.centerLeft
          ),
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
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,  
        ),
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
    );
  }
}
