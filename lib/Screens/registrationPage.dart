import 'package:firebasre_project/Screens/OTP_animation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebasre_project/Animation/FadeAnimation.dart';



var assetImage = AssetImage('assets/images/background.png');


class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

 

class _RegistrationPageState extends State<RegistrationPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String mobile;
  bool isValid1 = false;
  bool isValid2 = false;
  bool buttonVisibleFlag = false;
  var phoneNumber;
  String code;
  String _verificationCode;
  int _verificationId;  

 // bool _autoValidate = false;
  //String _mobile;
  List<String> credentials =["phoneNumber","code"];
  final _phoneNumberController = TextEditingController();


  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
     
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid1 = true;
      });
    }
  }


Future<String>createUser(String phoneNo) async {
  final String apiUrl =
      "http://visitzservice.azurewebsites.net/api/getauthcode-debug";

  var response = await http.post(apiUrl,
     body: phoneNo, headers: {'Content-Type': 'application/json'});

  

  if (response.statusCode == 200) {
    print("2. Hi from if Reg");
     _verificationId = jsonDecode(response.body);
     _verificationCode = _verificationId.toString();
      print("From Future"+_verificationCode);
    return _verificationCode;
  } else {
    print("Error !!!");
    return null;
  }
}   




  String validateMobile(String value) {
    String patttern = r"^[6-9][0-9]{9}$";
    RegExp regExp = new RegExp(patttern);
    if (value.length ==0 ) { 
     return "Mobile Number is Required";
    } else if (value.length != 10) {
      return "Mobile Number must have 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Enter valid Number";
    }else{ 
     isValid2 = true;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
          child: new Container(
            child: new Form(
                key: _key,
                autovalidate: _validate,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/images/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: FadeAnimation(1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    )),
	                  ),
                    Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top:0),
	                      child: Center(
	                        child: Text("Visitz", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.3, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 25,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/clock.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  
	                ],
	              ),
	            ),
                      SizedBox(
                        height: 100,
                      ),
                      FadeAnimation(2,
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.only(left: 8.0, top: 30),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new RaisedButton(
                            shape:RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(5.0)
                              ),
                            color: Colors.green[300],
                              
                             padding: EdgeInsets.only(
                                  top: 16.0,
                                  bottom: 16.0,
                             ),

                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "REGISTER",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            onPressed: () {showModalBottomSheet(
                              
                              context: context,
                              isScrollControlled: true,
                            

                              builder: (BuildContext bc){
                                print("VALID CC1: $isValid1");
                                print("VALID CC1: $isValid2");

                                return StatefulBuilder(
                                  builder: (BuildContext context, 
                                  StateSetter state) {
                                    return Container(
                                      padding: EdgeInsets.all(16),
                                      height: MediaQuery.of(context).size.height * 0.7,
                                      child: new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("REGISTER",
                                              style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black),
                                              ),
                                          Text('Login/Create Account to Get Quick Access',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.normal,
                                                color: Colors.black),
                                              ),
                                          SizedBox(height: 20.0),
                                          Padding(padding: EdgeInsets.only(bottom:0),
                                                child:TextFormField(
                                                  decoration:new InputDecoration(
                                                     enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white),
                                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.green),
                                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                                    filled: true,
                                                    fillColor: Colors.grey[200],
                                                    hintText: 'Mobile Number',
                                                    labelText: "10 Digit Mobile Number",
                                                    prefix: Container(
                                                      padding:EdgeInsets.all(4.0),
                                                      child: Text("+91",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:FontWeight.bold
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  maxLength: 10,
                                                   validator:validateMobile,
                                                   
                                                  onSaved: (String val) {
                                                  mobile = val;
                                                  },
                                                  keyboardType: TextInputType.number,
                                                  controller: _phoneNumberController,
                                                  autofocus: true,
                                                  onChanged: (text){
                                                    validate(state);
                                                  },

                                                autovalidate: true,
                                                autocorrect: false,
                                                maxLengthEnforced: true,
                                                
                                                )    
                                          ),

                                        SizedBox(height: 50.0,),

                                         new Container(
                                           padding: EdgeInsets.all(10),
                                           child: Center(
                                             child: RaisedButton(
                                              color: Colors.green[300],
                                              padding: EdgeInsets.all(16.0),
                                               shape:RoundedRectangleBorder(
                                                   borderRadius:BorderRadius.circular(5.0)
                                                   ),
                                                child: Text("CONTINUE",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight:FontWeight.bold
                                                  ),
                                                ),   

                                               onPressed: () {
                                                  print("VALID CC1: $isValid1");
                                                  print("VALID CC1: $isValid2");
                                                          if (isValid1 && isValid2) {
                                                            phoneNumber = _phoneNumberController.text;
                                                          // code = await createUser(phoneNumber); 
                                                           // print(" 1 . from button "+phoneNumber);
                                                            // print(" 2 . from button "+code);

                                                             print("From onPress");

                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          OTP_animation(
                                                                    mobileDetails:
                                                                      credentials = [phoneNumber,"6548"],
                                                                  ),
                                                                ));
                                                          } else {
                                                            Text("Not Well !!!");
                                                            validate(state);
                                                          }
                                                        },
                                               )
                                           ),
                                            )
                                            

                                        ],
                                      ),
                                    ) ;
                                  },
                                );

                              }
                              
                              );
                            }
                          ),
                        ),
                      ),
                      )


                    ])),
          ),
        ),
      ),
    );
  }

  
}
