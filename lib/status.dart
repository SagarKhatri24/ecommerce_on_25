import 'package:flutter/material.dart';

class StatusState extends StatefulWidget{
  const StatusState({super.key});


  @override
  StatusMain createState() => StatusMain();

}

class StatusMain extends State<StatusState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: Container(
        color: Colors.yellow.shade100,
      ),
    );
  }

}