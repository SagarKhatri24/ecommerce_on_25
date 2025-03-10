import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginState(),
    );
  }
}

class LoginState extends StatefulWidget{

  @override
  LoginMain createState() => LoginMain();

}

class LoginMain extends State<LoginState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: Container(
        color: Colors.brown.shade100,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'asset/icons/map_pointer.png',
                width: 100.0,
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Enter Email Id",
                    labelText: "Email Id"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: "Enter Password",
                    labelText: "Password"
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
                      print("Login Successfully");
                      Fluttertoast.showToast(
                        gravity: ToastGravity.BOTTOM,
                        msg: "Login Successfully",
                        toastLength: Toast.LENGTH_LONG
                      );
                    }, 
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
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