import 'package:ecommerce_on_25/custom_list.dart';
import 'package:ecommerce_on_25/home.dart';
import 'package:ecommerce_on_25/list.dart';
import 'package:ecommerce_on_25/sqliteHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SqliteApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SqliteState(),
    );
  }
}

class SqliteState extends StatefulWidget{

  @override
  SqliteMain createState() => SqliteMain();

}

class SqliteMain extends State<SqliteState>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sName,sEmail,sContact, sPassword;
  var dbHelper = SqliteDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sqlite",
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.brown.shade100,
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
                            hintText: "Enter Name",
                            labelText: "Name"
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Name Required";
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            sName = value!;
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
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 150.0,
                          height: 40.0,
                          color: Colors.brown.shade400,
                          child: TextButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                formKey.currentState!.save();
                                insertData(sName,sEmail,sContact,sPassword);
                              }
                            }, 
                            child: Text(
                              "Insert",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
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
                              if(formKey.currentState!.validate()){
                                formKey.currentState!.save();
                                updateData(sName,sEmail,sContact,sPassword);
                              }
                            }, 
                            child: Text(
                              "Update",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
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
                              formKey.currentState!.save();
                              deleteData(sContact);
                            }, 
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
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
                              showData();
                            }, 
                            child: Text(
                              "Show",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.0),),
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
                              formKey.currentState!.save();
                              searchData(sContact);
                            }, 
                            child: Text(
                              "Search",
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

  void insertData(String sName, String sEmail, String sContact, String sPassword) async{
    Map<String,dynamic> rows = {
      SqliteDatabaseHelper.columnName : sName,
      SqliteDatabaseHelper.columnEmail : sEmail,
      SqliteDatabaseHelper.columnContact : sContact,
      SqliteDatabaseHelper.columnPassword : sPassword
    };

    final id = await dbHelper.insert(rows);
    Fluttertoast.showToast(
      msg: "Insert Successfully",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3
    );
    print("Inserted Id : $id");
  }

  void updateData(String sName, String sEmail, String sContact, String sPassword) async{
    Map<String,dynamic> rows = {
      SqliteDatabaseHelper.columnName : sName,
      SqliteDatabaseHelper.columnEmail : sEmail,
      SqliteDatabaseHelper.columnPassword : sPassword
    };

    final id = await dbHelper.update(rows,sContact);
    Fluttertoast.showToast(
      msg: "Update Successfully",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3
    );
    print("Updated Id : $id");
  }

  void deleteData(String sContact) async{
    final id = await dbHelper.delete(sContact);
    Fluttertoast.showToast(
      msg: "Delete Successfully",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3
    );
    print("Deleted Id : $id");
  }

  void showData() async {
    var listData = await dbHelper.getAllData();
    for(var i=0;i<listData.length;i++){
      print(listData[i]);
    }
  }

  void searchData(String sContact) async {
    var listData = await dbHelper.getSearchData(sContact);
    for(var i=0;i<listData.length;i++){
      print(listData[i]);
    }
  }

}