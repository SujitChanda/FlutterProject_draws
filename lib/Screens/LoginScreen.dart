//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasre_project/Screens/HomeScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'otp_screen.dart';


/*
class LoginScreen extends StatelessWidget {
   

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  final _key = GlobalKey<FormState>();
   

  Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          AuthResult result = await firebaseAuth.signInWithCredential(credential);
          FirebaseUser user = result.user;

          if(user != null){
           Navigator.push(context,MaterialPageRoute (
             builder: (context) => HomeScreen(user: user,)

                 // Auto Retrival

            ));
          }else{
            print("Error!!! ");
          }
        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
            barrierDismissible: false,
            builder: (context){
                return AlertDialog(
                  title: Text("Enter OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          prefixIcon: Icon(Icons.phone_android),
                          hintText: "OTP",
                          filled: true,
                          fillColor: Colors.grey[200],


                        ),
                        controller: _codeController,

                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      onPressed: () async{
                        final code =_codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

                        AuthResult result = await firebaseAuth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if(user != null){
                          Navigator.push(context,MaterialPageRoute (
                              builder: (context) => HomeScreen(user: user,)

                            // Auto Retrival

                          ));
                        }else{
                          print("Error!!! ");
                        }

                        },
                    )
                  ],
                );
            }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              Text("Login",style: TextStyle(color: Colors.blueAccent,fontSize: 36,fontWeight: FontWeight.bold),),

              SizedBox(height: 60,),



              TextFormField(
                keyboardType: TextInputType.phone,
        
                controller: _phoneController,
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blueAccent),
                       borderRadius: BorderRadius.all(Radius.circular(10))
                       
                   ),
                   focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.greenAccent),
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: "Mobile Number",
                  labelText: "Mobile Number",
                  prefixText: "+91 ",
                 // filled: true,
                 // fillColor: Colors.grey[200],
                ),
                validator: (value){
                  if(value.isEmpty) {
                    return "Enter Mobile Number";
                  }
                  else if(value.length!=10){
                    return "Enter Currect Mobile Number ";
                  }else{
                    return null;
                  }
                },
                
              ),
              
              Text("* Enter 10 Digit Mobile Number",style: TextStyle(color: Colors.blueAccent,fontSize: 14),),

              SizedBox(height: 60,),


              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  color: Colors.blueAccent,
                  child: Text("LOGIN"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: (){
                    if(_key.currentState.validate()){
                    final phone = "+91"+_phoneController.text.trim();
                    loginUser(phone, context);
                  }
                    

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
*/


class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.only(left: 8.0, top: 30),
      alignment: Alignment.center,
      child: new RaisedButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.blueAccent,
        onPressed: () => {},
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new FlatButton(
                  onPressed: () {
                    print("pressed");
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext bc) {
                          print("VALID CC: $isValid");

                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter state) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'REGISTER / LOGIN',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'Login/Create Account quickly to Generate QR Code',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _phoneNumberController,
                                      autofocus: true,
                                      onChanged: (text) {
                                        validate(state);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "10 digit mobile number",
                                        prefix: Container(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            "+91",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      autovalidate: true,
                                      autocorrect: false,
                                      maxLengthEnforced: true,
                                      validator: (value) {
                                        return !isValid
                                            ? 'Please provide a valid 10 digit phone number'
                                            : null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        child: RaisedButton(
                                          color: !isValid
                                              ? Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.5)
                                              : Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Text(
                                            !isValid
                                                ? "ENTER PHONE NUMBER"
                                                : "CONTINUE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            if (isValid) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        OTPScreen(
                                                      mobileNumber:
                                                          _phoneNumberController
                                                              .text,
                                                    ),
                                                  ));
                                            } else {
                                              validate(state);
                                            }
                                          },
                                          padding: EdgeInsets.all(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  },
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Phone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
