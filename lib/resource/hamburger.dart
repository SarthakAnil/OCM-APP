import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ocm/resource/functions.dart';

// ignore: must_be_immutable
class HamMenu extends StatelessWidget {
  var name, email;
  setVal() async {
    name = await getUserInfo('Name');
    email = await getUserInfo('email');
  }

  HamMenu() {
    setVal();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ocm.png"),
              backgroundColor: Colors.white,
            ),
          ),
          Text("data")
        ],
      ),
    );
  }
}
