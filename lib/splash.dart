import 'dart:async';

import 'package:ecommerce_on_25/bottom_nav.dart';
import 'package:ecommerce_on_25/custom_list.dart';
import 'package:ecommerce_on_25/navigationDemo.dart';
import 'package:ecommerce_on_25/sqliteDemo.dart';
import 'package:ecommerce_on_25/tabDemo.dart';
import 'package:flutter/material.dart';

class SplashDemo extends StatelessWidget{

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
    return new Timer(
      Duration(seconds: 3), 
      (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> SqliteApp()));
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