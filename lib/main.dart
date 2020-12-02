import 'package:flutter/material.dart';
import 'package:ocm/pages/home.dart';
import './pages/login.dart';
import './resource/functions.dart';

void main() {
  runApp(OCM());
}

class OCM extends StatefulWidget {
  @override
  _OCMState createState() => _OCMState();
}

class _OCMState extends State<OCM> {
  var state = false;

  Widget body() {
    if (!state) checkState();
    return state ? OcmLogin() : Home();
  }

  checkState() async {
    await getUsername().then((value) {
      if (value == null) {
        setState(() {
          state = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ocm",
      home: Scaffold(
        body: body(),
      ),
    );
  }
}
