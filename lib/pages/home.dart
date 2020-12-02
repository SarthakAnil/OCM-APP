import 'package:flutter/material.dart';
import 'package:ocm/pages/temp.dart';
import 'package:ocm/resource/hamburger.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamMenu(),
      appBar: AppBar(
        title: Center(child: Text("OCM HOME")),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListUserTable(),
              ),
            );
          },
        ),
      ),
    );
  }
}
