import 'package:firebasre_project/Screens/SuccessScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:pin_input_text_field/pin_input_text_field.dart';
import './otp_input.dart';




class OTPScreen extends StatefulWidget {
  final List mobileDetails;
  OTPScreen({
    Key key,
    @required this.mobileDetails,
  })  : assert(mobileDetails != null),
        super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState(mobileDetails);
}

class _OTPScreenState extends State<OTPScreen> {
  
  final List mobileDetails;
  _OTPScreenState(this.mobileDetails);

  
 

  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();

  /// Decorate the outside of the Pin.
  PinDecoration _pinDecoration =
      UnderlineDecoration(enteredColor: Colors.green, hintText: '****');

  //bool isCodeSent = false;
  



  @override
  Widget build(BuildContext context) {
   // print("isValid - $isCodeSent");
  // print(mobileDetails[0]);
    print("mobile ${widget.mobileDetails[0]}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(left: 16.0, bottom: 16, top: 4),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Verify Details",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "OTP sent to ${widget.mobileDetails[0]}",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PinInputTextField(
                pinLength: 4,
                decoration: _pinDecoration,
                controller: _pinEditingController,
                autoFocus: true,
                textInputAction: TextInputAction.done,
                onSubmit: (pin) {
                  if (pin.length == 4) {
                    //_onFormSubmitted();
                  } else {
                    showToast("Invalid OTP", Colors.red);
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RaisedButton(
                    color: Colors.green[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "ENTER OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_pinEditingController.text.length == 4) {
                        Navigator.pushReplacement(context,
                         MaterialPageRoute(builder:(context) => HomePage(),
                        ));
                      } else {
                        showToast("Invalid OTP", Colors.red);
                      }
                    },
                    padding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ),

            Container(
            child:Text("*OTP : ${widget.mobileDetails[1]}"),
            )
          ],
        ),
      ),
    );
  }

  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        //timeInSecForIos: 2,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

 

    
  

  //void _onFormSubmitted() async {
  //  AuthCredential _authCredential = PhoneAuthProvider.getCredential(
   //     verificationId: _verificationId, smsCode: _pinEditingController.text);  
  //}
}
