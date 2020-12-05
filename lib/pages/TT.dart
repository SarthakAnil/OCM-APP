import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocm/pages/alert.dart';
import 'package:ocm/server/fetchTT.dart';

class TT extends StatelessWidget {
  final heading = TextStyle(fontSize: 30);
  final String batchID;
  TT(this.batchID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchTT(batchID),
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
                                    Text(snapshot.data.monday[index].courseId),
                                onTap: () {
                                  hourDetail(
                                    context,
                                    snapshot.data.monday[index].courseDesc,
                                    ((snapshot.data.monday[index].firstName ??
                                            "") +
                                        " " +
                                        (snapshot.data.monday[index]
                                                .middleName ??
                                            "") +
                                        " " +
                                        (snapshot.data.monday[index].lastName ??
                                            "")),
                                    (snapshot.data.monday[index].teacherEmail ??
                                        ""),
                                    snapshot.data.monday[index].teacherMobile
                                        .toString(),
                                  );
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
                                    Text(snapshot.data.tuesday[index].courseId),
                                onTap: () {
                                  hourDetail(
                                    context,
                                    snapshot.data.tuesday[index].courseDesc,
                                    ((snapshot.data.tuesday[index].firstName ??
                                            "") +
                                        " " +
                                        (snapshot.data.tuesday[index]
                                                .middleName ??
                                            "") +
                                        " " +
                                        (snapshot
                                                .data.tuesday[index].lastName ??
                                            "")),
                                    (snapshot
                                            .data.tuesday[index].teacherEmail ??
                                        ""),
                                    snapshot.data.tuesday[index].teacherMobile
                                        .toString(),
                                  );
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
                                    snapshot.data.wednesday[index].courseId),
                                onTap: () {
                                  hourDetail(
                                    context,
                                    snapshot.data.wednesday[index].courseDesc,
                                    ((snapshot.data.wednesday[index]
                                                .firstName ??
                                            "") +
                                        " " +
                                        (snapshot.data.wednesday[index]
                                                .middleName ??
                                            "") +
                                        " " +
                                        (snapshot.data.wednesday[index]
                                                .lastName ??
                                            "")),
                                    (snapshot.data.wednesday[index]
                                            .teacherEmail ??
                                        ""),
                                    snapshot.data.wednesday[index].teacherMobile
                                        .toString(),
                                  );
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
                                subtitle: Text(
                                    snapshot.data.thursday[index].courseId),
                                onTap: () {
                                  hourDetail(
                                    context,
                                    snapshot.data.thursday[index].courseDesc,
                                    ((snapshot.data.thursday[index]
                                                .firstName ??
                                            "") +
                                        " " +
                                        (snapshot.data.thursday[index]
                                                .middleName ??
                                            "") +
                                        " " +
                                        (snapshot.data.thursday[index]
                                                .lastName ??
                                            "")),
                                    (snapshot.data.thursday[index]
                                            .teacherEmail ??
                                        ""),
                                    snapshot.data.thursday[index].teacherMobile
                                        .toString(),
                                  );
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
                                    Text(snapshot.data.friday[index].courseId),
                                onTap: () {
                                  hourDetail(
                                    context,
                                    snapshot.data.friday[index].courseDesc,
                                    ((snapshot.data.friday[index].firstName ??
                                            "") +
                                        " " +
                                        (snapshot.data.friday[index]
                                                .middleName ??
                                            "") +
                                        " " +
                                        (snapshot.data.friday[index].lastName ??
                                            "")),
                                    (snapshot.data.friday[index].teacherEmail ??
                                        ""),
                                    snapshot.data.friday[index].teacherMobile
                                        .toString(),
                                  );
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
