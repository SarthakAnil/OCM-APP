import 'package:flutter/material.dart';

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
