import 'dart:convert';

import 'package:ecommerce_on_25/JsonSignup.dart';
import 'package:ecommerce_on_25/constantSp.dart';
import 'package:ecommerce_on_25/jsonProfile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonLoginApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonLoginState(),
    );
  }
}

class JsonLoginState extends StatefulWidget{

  @override
  JsonLoginMain createState() => JsonLoginMain();

}

class JsonLoginMain extends State<JsonLoginState>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sEmail, sPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Json Login",
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      backgroundColor: Colors.brown.shade100,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'asset/icons/map_pointer.png',
                  width: 100.0,
                  height: 100.0,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Email Id",
                            labelText: "Email Id"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Email Id Required";
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            sEmail = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Password",
                            labelText: "Password"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Password Required";
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            sPassword = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 150.0,
                          height: 40.0,
                          color: Colors.brown.shade400,
                          child: TextButton(
                            onPressed: () async {
                              if(formKey.currentState!.validate()){
                                formKey.currentState!.save();
                                var connectivity = await(Connectivity().checkConnectivity());
                                if(connectivity == ConnectivityResult.wifi || connectivity == ConnectivityResult.mobile){
                                  loginData(sEmail,sPassword);
                                }
                              }
                            }, 
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 150.0,
                          height: 40.0,
                          color: Colors.brown.shade400,
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> JsonSignupState() ));
                            }, 
                            child: Text(
                              "Signup",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginData(String email, String password) async {

    var sp = await SharedPreferences.getInstance();

    var map = {
      "email" : email,
      "password" : password
    };

    var data = await http.post(Uri.parse(ConstantSp.LOGIN_URL),body: map);
    if(data.statusCode == 200){
        var jsonData = jsonDecode(data.body);
        if(jsonData["status"] == true){
          Fluttertoast.showToast(
            msg: jsonData["message"],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM
          );
          var userData = jsonData["UserData"];
          for(int i=0; i< userData.toString().length;i++){
            var sUserId = userData[i]["userid"];
            var sFirstName = userData[i]["first_name"];
            var sLastName = userData[i]["last_name"];
            var sEmail = userData[i]["email"];
            var sContact = userData[i]["contact"];
            var sGender = userData[i]["gender"];
            var sProfile = userData[i]["profile"];

            sp.setString(ConstantSp.USERID, sUserId);
            sp.setString(ConstantSp.FIRSTNAME, sFirstName);
            sp.setString(ConstantSp.LASTNAME, sLastName);
            sp.setString(ConstantSp.EMAIL, sEmail);
            sp.setString(ConstantSp.CONTACT, sContact);
            sp.setString(ConstantSp.GENDER, sGender);
            sp.setString(ConstantSp.PROFILE, sProfile);

          }
          Navigator.push(context, MaterialPageRoute(builder: (_)=> JsonProfileState()));
          //Navigator.pop(context);
        }
        else{
          Fluttertoast.showToast(
            msg: jsonData["message"],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM
          );
        }
    }
    else{
      Fluttertoast.showToast(
        msg: "Server Error Code : ${data.statusCode}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM
      );
    }

  }

}