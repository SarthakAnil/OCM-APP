import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ocm/pages/TT.dart';
import 'package:ocm/pages/login.dart';
import 'package:ocm/pages/teacherTT.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/alert.dart';

// ignore: must_be_immutable
class HamMenu extends StatelessWidget {
 final String name, email, usrId,batchID;
  final bool roleId;
  HamMenu(this.name, this.email, this.usrId, this.roleId,this.batchID);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              (name == null) ? "" : name,
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text((email == null) ? "" : email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ocm.png"),
              backgroundColor: Colors.white,
            ),
          ),
          !roleId
              ? ListTile(
                  title: Text("Time Table"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TT(batchID),
                      ),
                    );
                  },
                )
              : ListTile(
                  title: Text("Sechedule"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherTT(usrId),
                      ),
                    );
                  },
                ),
          ListTile(
            title: Text("Change Password"),
            onTap: () {
              changePassConfirm(context);
            },
          ),
          ListTile(
            title: Text(
              "LOGOUT",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => OcmLogin(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
