import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationState extends StatefulWidget{
  const NavigationState({super.key});


  @override
  NavigationMain createState() => NavigationMain();

}

class NavigationMain extends State<NavigationState>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Navigation Drawer",
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey.shade200,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("User Name"), 
                accountEmail: Text("username@gmail.com"),
                currentAccountPicture: Icon(Icons.verified_user),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: (){
                  showMessage("Home");
                },
              ),
              ListTile(
                leading: const Icon(Icons.verified_user),
                title: const Text("Profile"),
                onTap: (){
                  showMessage("Profile");
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: (){
                  showMessage("Logout");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showMessage(message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM
    );
  }

}