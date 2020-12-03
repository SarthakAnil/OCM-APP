import 'package:flutter/material.dart';
import 'package:ocm/pages/alert.dart';
import '../server/fetchEvents.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListUserTable extends StatelessWidget {
  final usrID;
  ListUserTable(this.usrID);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: fetchEvents(usrID),
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
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: ListTile(
                      title: Text(snapshot.data[index].eventName),
                      subtitle: Text(snapshot.data[index].eventId),
                      onTap: () {
                        eventTap(context, snapshot.data[index].eventDesc);
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
