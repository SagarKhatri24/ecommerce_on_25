import 'dart:async';

import 'package:ecommerce_on_25/JsonSignup.dart';
import 'package:ecommerce_on_25/bottom_nav.dart';
import 'package:ecommerce_on_25/constantSp.dart';
import 'package:ecommerce_on_25/custom_list.dart';
import 'package:ecommerce_on_25/jsonLogin.dart';
import 'package:ecommerce_on_25/jsonProfile.dart';
import 'package:ecommerce_on_25/navigationDemo.dart';
import 'package:ecommerce_on_25/sqliteDemo.dart';
import 'package:ecommerce_on_25/tabDemo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashDemo extends StatelessWidget{
  const SplashDemo({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashState(),
    );
  }

}

class SplashState extends StatefulWidget{
  const SplashState({super.key});


  @override
  SplashMain createState() => SplashMain();

}

class SplashMain extends State<SplashState>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimerMethod();
  }

  Future<Timer> startTimerMethod() async{
    var sp = await SharedPreferences.getInstance();
    var sUserId = sp.getString(ConstantSp.USERID) ?? "";
    return Timer(
      const Duration(seconds: 3), 
      (){
        if(sUserId == ""){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> JsonLoginApp()));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (_)=> JsonProfileState()));
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            "asset/icons/map_pointer.png",
            width: 100.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }

}