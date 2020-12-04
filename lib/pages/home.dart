import 'package:flutter/material.dart';
import 'package:ocm/pages/ListEvents.dart';
import 'package:ocm/resource/functions.dart';
import 'package:ocm/resource/hamburger.dart';
import 'package:ocm/server/putEvent.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name, email, usrID, roll, roleId = false;

  setVal() async {
    name = await getUserInfo('Name');
    email = await getUserInfo('email');
    usrID = await getUserInfo('userid');
    roll = await getUserInfo('role_id');
    if (roll == "0") roleId = true;

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
      floatingActionButton: roleId
          ? FloatingActionButton.extended(
              label: Text("ADD Event"),
              icon: Icon(Icons.add),
              onPressed: () {
                addEventBottomSheet(context);
              },
            )
          : null,
    );
  }

  addEventBottomSheet(BuildContext context) {
    var descController = TextEditingController();
    var batchController = TextEditingController();
    var idController = TextEditingController();
    var nameController = TextEditingController();
    bool err = false;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32.0),
          ),
        ),
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, state) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 10,
                      right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "ADD new events",
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.cancel),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: idController,
                        onChanged: (val) async {
                          bool ret = false;
                          // print(val);
                          ret = await checkID(val);
                          if (ret != err) {
                            state(() {
                              print("setting err to ret");
                              err = ret;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          errorText: err ? "ID exists!!!" : null,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Event ID",
                          hintText: "Event ID",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Event Name",
                          hintText: "Event Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: descController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Event Description",
                          hintText: "Event Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: batchController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: "Batch ID",
                          hintText: "Target Batch",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(32.0),
                        color: Color(0xff01A0C7),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * .5,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () async {
                            await putEvent(
                                idController.text,
                                usrID,
                                batchController.text,
                                nameController.text,
                                descController.text);
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          child: Text(
                            "ADD EVENT",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
