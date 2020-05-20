import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'Constants.dart';
import 'generate.dart';
import 'scan.dart';
import 'ActivityList.dart';
import 'userProfile.dart';

var assetImage = AssetImage('assets/logo1.jpg');

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;
  HomeScreen({Key key, this.user}) : assert(user!= null), super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR REGISTER"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                    );
              }).toList();
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[

        
             UserAccountsDrawerHeader(
              accountName: Text("Sujit Chanda"), 
              accountEmail: Text("S.chanda@outlook.com"),
              currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage('assets/android.jpg'),
              ),
              ),

             
              Card(
                color: Colors.redAccent,
                child: ListTile(
                leading: Icon(Icons.edit,color: Colors.white,),
                title: Text('Edit Profile', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,),),
                onTap: (){
                    Navigator.of(context).pop();
                        Navigator.push(context, new MaterialPageRoute(
                         builder: (BuildContext context) => new userProfile())
                         );
                      },
                    ),
                  ),

            new Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Divider(
              color:Colors.black,
              height: 10.0,),
            ),
            
            Card(
              color: Colors.redAccent,
              child:
              ListTile(
              leading: Icon(Icons.local_activity,color: Colors.white,),
              title: Text('Activity List', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new ActivityList())
                 );
              },
            ),
            ),
            
            new Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Divider(
              color:Colors.black,
              height: 10.0,),
            ),

          Card(
            color: Colors.redAccent,
            child: ListTile(
              leading: Icon(Icons.vpn_key, color: Colors.white,),
              title: Text('Sign Out', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,),),
              onTap: (){
                Navigator.of(context).pop();
                 _firebaseAuth.signOut();
                 Navigator.pushReplacement(
                 context, MaterialPageRoute(builder: (context) => App()));
              },
            ),
          )

          ],
        )
      ),
     body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           
            new Center(
                 child: Container(
                   height: 200,
                   width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 5),
                    image: DecorationImage(
                    image: assetImage, 
                    fit: BoxFit.cover
                      )
                   ),
                   ),
                   ),
               
                Divider(height: 80.0),

            flatButton("Scan QR CODE", ScanPage()),
            SizedBox(height: 20.0,),
            flatButton("Generate QR CODE", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue,width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
  void choiceAction(String choice){

  if( choice == Constants.signOut){

  _firebaseAuth.signOut();
    Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => App()));

  }

}


}