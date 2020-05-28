import 'package:http/http.dart' as http;
import 'dart:convert';

var responseString = "0";

Future createUser(String phoneNo) async {
  final String apiUrl =
      "http://visitzservice.azurewebsites.net/api/getauthcode-debug";

  final response = await http.post(apiUrl,
      body: phoneNo, headers: {'Content-Type': 'application/json'});

      var convertedDatatoJson = jsonDecode(response.body);
     

  if (response.statusCode == 200) {
    print("Hi from if");
    responseString = response.body;
    print(responseString);
    

    //return userModelFromJson(responseString);
  } else {
    print("Hi from else");

    //responseString = response.body;
    //print(responseString);
    // return userModelFromJson(responseString);
  }

   return convertedDatatoJson;
}