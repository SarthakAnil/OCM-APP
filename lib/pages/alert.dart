import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import '../resource/functions.dart';

void showMyDialog(BuildContext context, String errMsg) {
  showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        title: Text('Authentatication Error!!!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(errMsg),
              Text('Please Check your Crenditials!!'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

void eventTap(BuildContext context, String msg) {
  showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        title: Text('Event Description'),
        content: SingleChildScrollView(
          child: Text(msg),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}



void showAlert(BuildContext context, String msg) {
  showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        title: Text('ALERT!!!'),
        content: SingleChildScrollView(
          child: Text(msg),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
void changePassConfirm(BuildContext context) {
  showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        title: Text('Password Change'),
        content: SingleChildScrollView(
          child: Text(
              "Set a password that is known to you only admisistrator can reset Lost Password"),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
              callPassChange(context);
            },
          ),
        ],
      );
    },
  );
}

void callPassChange(BuildContext context) {
  showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PassChange();
      });
}

class PassChange extends StatefulWidget {
  @override
  _PassChangeState createState() => _PassChangeState();
}

class _PassChangeState extends State<PassChange> {
  final passCon = TextEditingController();
  final confirmPassCon = TextEditingController();
  var pattern = "";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      title: Text('Password Change'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            PasswordField(
              hasFloatingPlaceholder: true,
              floatingText: "Password",
              controller: passCon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            SizedBox(
              height: 30, ////////
              child: Center(
                child: Text(
                  pattern,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ),
            PasswordField(
              controller: confirmPassCon,
              hasFloatingPlaceholder: true,
              errorMessage: "Passwords doesn't match",
              floatingText: "Confirm Password",
              hintText: "Confirm Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: const Text('OK'),
          onPressed: () async {
            if (passCon.text != confirmPassCon.text)
              setState(() {
                passCon.text = confirmPassCon.text = "";
                pattern = "passwords didn't match";
              });
            else {
              await changeServerpass(confirmPassCon.text);
              Navigator.of(context).pop(true);
              eventTap(context, "Password Changed!!!");
            }
          },
        ),
      ],
    );
  }
}
