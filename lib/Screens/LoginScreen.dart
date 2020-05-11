//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasre_project/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class LognScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();


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
          child: Column(
            children: <Widget>[
              Text("Login",style: TextStyle(color: Colors.blueAccent,fontSize: 36,fontWeight: FontWeight.bold),),

              SizedBox(height: 60,),



              TextFormField(
                controller: _phoneController,
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
                  hintText: "Mobile Number",
                  filled: true,
                  fillColor: Colors.grey[200],


                ),
              ),

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
                    final phone = _phoneController.text.trim();
                    loginUser(phone, context);

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
