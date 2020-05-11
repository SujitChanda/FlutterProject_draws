import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Registration",style: TextStyle(color: Colors.blueAccent,fontSize: 36,fontWeight: FontWeight.bold),),
                SizedBox(height: 50,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.grey[200],


                  ),
                  ),
                SizedBox(height: 30,),
                TextFormField(

                  controller: _passController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.grey[200],


                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(

                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    prefixIcon: Icon(Icons.perm_identity),
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.grey[200],


                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(

                  controller: _imageController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    prefixIcon: Icon(Icons.image),
                    hintText: "Image",
                    filled: true,
                    fillColor: Colors.grey[200],


                  ),
                ),
                SizedBox(height: 60,),

                Container(
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.blueAccent,
                    child: Text("Register"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: (){

                    },
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
