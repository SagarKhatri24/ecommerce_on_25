import 'package:flutter/material.dart';

class HomeState extends StatefulWidget{

  String sEmail,sPassword;

  HomeState(this.sEmail,this.sPassword);

  @override
  HomeMain createState() => HomeMain();

}

class HomeMain extends State<HomeState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: Container(
        color: Colors.brown.shade100,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue.shade200,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Email Id",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue.shade300,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        widget.sEmail,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue.shade200,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue.shade300,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          widget.sPassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}