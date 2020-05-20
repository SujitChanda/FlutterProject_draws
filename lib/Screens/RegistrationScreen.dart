import 'otp_screen.dart';
import 'package:flutter/material.dart';


var assetImage = AssetImage('assets/logo1.jpg');



class RegistrationScreen extends StatelessWidget {

  final _emailController = TextEditingController();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _idController = TextEditingController();
  final _phoneNumberController = TextEditingController();

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
    return 
     Scaffold(
      appBar: AppBar(
        title: Text("Create New Account"),
        //leading: IconButton(icon: Image.asset('icon.png', fit: BoxFit.contain), onPressed: () { }),
      ),
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Center(
                 child: Container(
                   height: 120,
                   width: 120,
                  alignment: Alignment(0.9, -0.98),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3),
                    image: DecorationImage(
                    image: assetImage, 
                    fit: BoxFit.cover
                      )
                   ),
                   ),
                   ),

                   SizedBox(height: 10,),

                new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 0.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.25)),
                      ),
                    ),
                    Text(
                      "QR Register",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.25)),
                      ),
                    ),
                  ],
                ),
              ),

              

                SizedBox(height: 30,),
                
                TextFormField(
                  controller: _fNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    prefixIcon: Icon(Icons.perm_identity),
                    hintText: "First Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: "First Name"
                  ),
                  ),
                

                Divider(height: 25.0),

                TextFormField(
                  controller: _lNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    prefixIcon: Icon(Icons.perm_identity),
                    hintText: "Last Name",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: "Last Name"

                  ),
                ),
                Divider(
              height: 25.0,
            ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      
                    ),
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email ID",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: "Email"


                  ),
                ),
               Divider(
              height: 25.0,
            ),
                TextFormField(

                  controller: _idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: Icon(Icons.credit_card),
                    hintText: "Aadhar No.",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: "Aadhar Number"
                    


                  ),
                ),
                SizedBox(height: 20,),

              /*  Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("REGISTER",
                    style: TextStyle(
                     color: Colors.white,
                      fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    
                    onPressed: (){
                      Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => PhoneLogin()),
                      );
                    },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0))
                  ),
                ),  */
                

                 Container(
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),




                ],
              ),
            ),
          ), 
        ),
      
      );
    }
  }
