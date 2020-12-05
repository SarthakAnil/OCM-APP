import 'package:flutter/material.dart';
import 'package:ocm/pages/alert.dart';
import '../server/fetchTeacherTT.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TeacherTT extends StatelessWidget {
  final String usrID;
  final heading = TextStyle(fontSize: 30);
  TeacherTT(this.usrID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchTeacherTT(usrID),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null)
            return Container(
              child: Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 100,
                ),
              ),
            );
          else {
            // print(snapshot.data);
            // print(snapshot.data.monday.length);
            return DefaultTabController(
              length: 5,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "MON"),
                      Tab(text: "TUE"),
                      Tab(text: "WED"),
                      Tab(text: "THUR"),
                      Tab(text: "FRI"),
                    ],
                  ),
                  title: Text('Time Table'),
                ),
                body: TabBarView(
                  children: [
                    Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.monday.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                // shape:
                                //selected: true,
                                trailing: Icon(Icons.keyboard_arrow_right),
                                leading: CircleAvatar(
                                  child: Text(
                                    snapshot.data.monday[index].hourId
                                        .toString(),
                                    style: heading,
                                  ),
                                  radius: 30,
                                  backgroundColor: Colors.blue,
                                ),
                                title: Text(
                                    snapshot.data.monday[index].courseName),
                                subtitle:
                                    Text(snapshot.data.monday[index].batchId),
                                onTap: () {
                                  secheduleDetail(
                                      context,
                                      snapshot.data.monday[index].batch,
                                      snapshot.data.monday[index].courseId,
                                      snapshot.data.monday[index].discipline,
                                      snapshot.data.monday[index].semester
                                          .toString(),
                                      snapshot.data.monday[index].courseDesc ??
                                          "");
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.tuesday.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                leading: CircleAvatar(
                                  child: Text(
                                    snapshot.data.tuesday[index].hourId
                                        .toString(),
                                    style: heading,
                                  ),
                                  radius: 30,
                                  backgroundColor: Colors.blue,
                                ),
                                title: Text(
                                    snapshot.data.tuesday[index].courseName),
                                subtitle:
                                    Text(snapshot.data.tuesday[index].batchId),
                                onTap: () {
                                  secheduleDetail(
                                      context,
                                      snapshot.data.monday[index].batch,
                                      snapshot.data.monday[index].courseId,
                                      snapshot.data.monday[index].discipline,
                                      snapshot.data.monday[index].semester
                                          .toString(),
                                      snapshot.data.monday[index].courseDesc ??
                                          "");
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.wednesday.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                leading: CircleAvatar(
                                  child: Text(
                                    snapshot.data.wednesday[index].hourId
                                        .toString(),
                                    style: heading,
                                  ),
                                  radius: 30,
                                  backgroundColor: Colors.blue,
                                ),
                                title: Text(
                                    snapshot.data.wednesday[index].courseName),
                                subtitle: Text(
                                    snapshot.data.wednesday[index].batchId),
                                onTap: () {
                                  secheduleDetail(
                                      context,
                                      snapshot.data.monday[index].batch,
                                      snapshot.data.monday[index].courseId,
                                      snapshot.data.monday[index].discipline,
                                      snapshot.data.monday[index].semester
                                          .toString(),
                                      snapshot.data.monday[index].courseDesc ??
                                          "");
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.thursday.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                leading: CircleAvatar(
                                  child: Text(
                                    snapshot.data.thursday[index].hourId
                                        .toString(),
                                    style: heading,
                                  ),
                                  radius: 30,
                                  backgroundColor: Colors.blue,
                                ),
                                title: Text(
                                    snapshot.data.thursday[index].courseName),
                                subtitle:
                                    Text(snapshot.data.thursday[index].batchId),
                                onTap: () {
                                  secheduleDetail(
                                      context,
                                      snapshot.data.monday[index].batch,
                                      snapshot.data.monday[index].courseId,
                                      snapshot.data.monday[index].discipline,
                                      snapshot.data.monday[index].semester
                                          .toString(),
                                      snapshot.data.monday[index].courseDesc ??
                                          "");
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.friday.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                trailing: Icon(Icons.keyboard_arrow_right),
                                leading: CircleAvatar(
                                  child: Text(
                                    snapshot.data.friday[index].hourId
                                        .toString(),
                                    style: heading,
                                  ),
                                  radius: 30,
                                  backgroundColor: Colors.blue,
                                ),
                                title: Text(
                                    snapshot.data.friday[index].courseName),
                                subtitle:
                                    Text(snapshot.data.friday[index].batchId),
                                onTap: () {
                                  secheduleDetail(
                                      context,
                                      snapshot.data.monday[index].batch,
                                      snapshot.data.monday[index].courseId,
                                      snapshot.data.monday[index].discipline,
                                      snapshot.data.monday[index].semester
                                          .toString(),
                                      snapshot.data.monday[index].courseDesc ??
                                          "");
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
