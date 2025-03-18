import 'package:ecommerce_on_25/call.dart';
import 'package:ecommerce_on_25/chat.dart';
import 'package:ecommerce_on_25/status.dart';
import 'package:flutter/material.dart';

class TabState extends StatefulWidget{

  @override
  TabMain createState() => TabMain();

}

class TabMain extends State<TabState> with SingleTickerProviderStateMixin{

  late TabController tabController;
  var tabArray = [ChatState(),StatusState(),CallState()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabArray.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tab Layout",
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey.shade200,
          bottom: getTabView(),
        ),
        body: getTabPage(),
      ),
    );
  }

  getTabView(){
    return TabBar(
      tabs: [
        Tab(text: "Chat",),
        Tab(text: "Status",),
        Tab(text: "Call",),
      ],
      controller: tabController,
      unselectedLabelColor: Colors.white,
      labelColor: Colors.black,
      indicatorColor: Colors.red,
    );
  }

  getTabPage(){
    return TabBarView(
      children: tabArray,
      controller: tabController,
    );    
  }

}