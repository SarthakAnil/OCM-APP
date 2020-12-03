import 'package:flutter/material.dart';
import 'package:ocm/pages/ListEvents.dart';
import 'package:ocm/resource/functions.dart';
import 'package:ocm/resource/hamburger.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name, email, usrID;
  setVal() async {
    name = await getUserInfo('Name');
    email = await getUserInfo('email');
    usrID = await getUserInfo('userid');
    setState(() {
      //   print("STate SET");
    });
    //  print("exiting setval");
  }

  @override
  void initState() {
    super.initState();
    // print("in init");
    setVal();
    //  print("exiting init");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamMenu(name, email, usrID),
      appBar: AppBar(
        title: Center(child: Text("OCM HOME")),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: Center(
                    child: Text(
                  (name == null) ? "" : name,
                  style: TextStyle(fontSize: 30),
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Center(
                    child: Text(
                  (usrID == null) ? "" : usrID,
                  style: TextStyle(fontSize: 18),
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Center(child: Text("Upcoming Events")),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .68,
                child: ListUserTable(usrID),
              )
            ],
          ),
        ),
      ),
    );
  }
}
