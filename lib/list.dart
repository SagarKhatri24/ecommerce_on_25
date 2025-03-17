import 'package:flutter/material.dart';

class ListState extends StatefulWidget{

  @override
  ListMain createState() => ListMain();

}

class ListMain extends State<ListState>{

  List<String> titleArray = ["Bronze","Silver","Gold","Platinum"];
  List<String> subTitleArray = ["Bronze Description","Silver Description","Gold Description","Platinum Description"];
  List<String> leadingArray = ["bronze_medal.png","silver-medal.png","gold_medal.png","platinum.png"];
  List<String> trailingArray = ["platinum.png","gold_medal.png","silver-medal.png","bronze_medal.png"];
  String imagePath = "asset/icons/";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List",
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: ListView.builder(
        itemCount: titleArray.length,
        itemBuilder: (context,position){
          return ListTile(
            title: Text(titleArray[position]),
            subtitle: Text(subTitleArray[position]),
            leading: Image.asset(imagePath + leadingArray[position]),
            trailing: Image.asset(imagePath + trailingArray[position]),
          );
        }
      ),
    );
  }

}