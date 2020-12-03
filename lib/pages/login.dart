import 'package:flutter/material.dart';
import 'package:ocm/pages/alert.dart';
import '../pages/home.dart';
import 'package:passwordfield/passwordfield.dart';
import 'dart:async';
import '../config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../resource/functions.dart';

class OcmLogin extends StatefulWidget {
  @override
  _OcmLoginState createState() => _OcmLoginState();
}

class _OcmLoginState extends State<OcmLogin> {
  final passwordController = TextEditingController();

  final userNameController = TextEditingController();

  Future checkUser(String usrName, String pass) async {
    var response = await http.post(
      BASE_URL + '/user_check',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'usrName': usrName},
      ),
    );

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)[0]['exist'] == 0)
        showMyDialog(context, "Unknown Username");
      else {
        var response = await http.post(
          BASE_URL + '/pass_check',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{'usrName': usrName},
          ),
        );
        if (response.statusCode == 200) {
          if (jsonDecode(response.body)[0]['pass'] == pass) {
            await setUserData(usrName);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          } else
            showMyDialog(context, "Wrong password");
        }
      }
    } else {
      throw Exception('Failed to load user_check details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 20,
          shape: StadiumBorder(),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width * .8,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .08),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    child: Image.asset("assets/images/ocm.png"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "username",
                      hintText: "username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PasswordField(
                    hasFloatingPlaceholder: true,
                    floatingText: "Password",
                    controller: passwordController,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xff01A0C7),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        checkUser(
                            userNameController.text, passwordController.text);
                      },
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
