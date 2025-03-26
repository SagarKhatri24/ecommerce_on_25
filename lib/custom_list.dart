import 'package:flutter/material.dart';

class CustomListState extends StatefulWidget{
  const CustomListState({super.key});


  @override
  CustomListMain createState() => CustomListMain();

}

class CustomListMain extends State<CustomListState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Custom List",
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: CustomListDesign(),
    );
  }

}

class CustomListDesign extends StatelessWidget{

  List<String> titleArray = ["Bronze","Silver","Gold","Platinum"];
  List<String> leadingArray = ["bronze_medal.png","silver-medal.png","gold_medal.png","platinum.png"];
  String imagePath = "asset/icons/";

  CustomListDesign({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return ListView.builder(
      itemCount: titleArray.length,
      itemBuilder: (context,position){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  Image.asset(
                    imagePath+leadingArray[position],
                    width: 100.0,
                    height: 100.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(titleArray[position]),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

}