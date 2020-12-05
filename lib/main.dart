import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ocm/pages/home.dart';
import './pages/login.dart';
import './resource/functions.dart';

void main() {
  runApp(OCM());
}

class OCM extends StatelessWidget {
  checkState() async {
    var returnData = await getUsername();
    if (returnData == null)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder(
        future: checkState(),
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
            if (snapshot.data == true)
              return OcmLogin();
            else
              return Home();
          }
        },
      )),
    );
  }
}
