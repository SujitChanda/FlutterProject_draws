import 'package:firebasre_project/Screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';


class OTP_animation extends StatefulWidget {
  final List mobileDetails;
  OTP_animation({Key key,
    @required this.mobileDetails,})  : assert(mobileDetails != null),
        super(key: key);
    
  @override
  _OTP_animationState createState() => _OTP_animationState(mobileDetails);
}

class _OTP_animationState extends State<OTP_animation> {
 
  final List mobileDetails;
  _OTP_animationState(this.mobileDetails);
  List<String> credentials =["phoneNumber","code"];
 
 


  String _animationName = "OTP_Getting";

  @override
  
  void initState() {
    super.initState();
    setState(() {
      _animationName = "OTP_Getting";
    });


    Future.delayed(Duration(seconds: 6),
    (){
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context ) => OTPScreen( 
            mobileDetails:credentials = 
            ["7980588604","6548"],
            )
      ));
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         body:Container(
           padding: EdgeInsets.all(32.0),
           child: Center(
             child: Column(
                 children: <Widget>[

                   SizedBox(height: 100,),

                  Text("Sending OTP ",
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                      ),
                  Text('Please wait ...',
                      style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                      FontWeight.normal,
                      color: Colors.black),
                  ),

                   Expanded(child:
                   FlareActor(
                     "assets/OTP_Getting.flr",
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




