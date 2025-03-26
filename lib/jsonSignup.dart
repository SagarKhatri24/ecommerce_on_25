import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_on_25/constantSp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class JsonSignupState extends StatefulWidget{
  const JsonSignupState({super.key});


  @override
  JsonSignupMain createState() => JsonSignupMain();

}

class JsonSignupMain extends State<JsonSignupState>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sFirstName,sLastName,sEmail,sContact, sPassword, sGender;
  int iGroupValue = 4;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Json Signup",
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
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter First Name",
                            labelText: "First Name"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "First Name Required";
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            sFirstName = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Last Name",
                            labelText: "Last Name"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Last Name Required";
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            sLastName = value!;
                          },
                        ),
                      ),
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
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Enter Contact No.",
                            labelText: "Contact No."
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Contact No. Required";
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            sContact = value!;
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Radio(
                                    value: 0, 
                                    groupValue: iGroupValue, 
                                    onChanged: (value){                    
                                      setState(() {
                                        setGender(0,"Male");
                                      });
                                    }
                                  ),
                                  const Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Radio(
                                    value: 1, 
                                    groupValue: iGroupValue, 
                                    onChanged: (value){                    
                                      setState(() {
                                        setGender(1,"Female");
                                      });
                                    }
                                  ),
                                  const Text(
                                    "Female",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Radio(
                                    value: 2, 
                                    groupValue: iGroupValue, 
                                    onChanged: (value){                    
                                      setState(() {
                                        setGender(2,"Transgender");
                                      });
                                    }
                                  ),
                                  const Text(
                                    "Transgender",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
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
                                  insertData(sFirstName,sLastName,sEmail,sContact,sPassword,sGender);
                                }
                              }
                            }, 
                            child: const Text(
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

  void setGender(value,message){
    iGroupValue = value;
    sGender = message;
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM  
    );
  }

  insertData(String firstName,String lastName, String email, String contact, String password, String gender) async {
    var map = {
      "firstname" : firstName,
      "lastname" : lastName,
      "email" : email,
      "contact" : contact,
      "password" : password,
      "gender" : gender
    };

    var data = await http.post(Uri.parse(ConstantSp.SIGNUP_URL),body: map);
    if(data.statusCode == 200){
        var jsonData = jsonDecode(data.body);
        if(jsonData["status"] == true){
          Fluttertoast.showToast(
            msg: jsonData["message"],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM
          );
          Navigator.pop(context);
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