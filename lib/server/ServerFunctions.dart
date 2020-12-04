import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

Future checkBatchID(String batchID) async {
  var ret = false;
  var response = await http.post(
    BASE_URL + '/batchid_check',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'batchID': batchID},
    ),
  );

  if (response.statusCode == 200) {
    //  print(jsonDecode(response.body)[0]['exist']);
    (jsonDecode(response.body)[0]['exist'] == 0) ? ret = true : ret = false;
    //return jsonDecode(response.body)[0];
    return ret;
  } else {
    throw Exception('Failed to load user_check details');
  }
}

Future checkID(String eventID) async {
  var ret = false;
  var response = await http.post(
    BASE_URL + '/eventid_check',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'eventID': eventID},
    ),
  );

  if (response.statusCode == 200) {
    //print(jsonDecode(response.body)[0]['exist']);
    (jsonDecode(response.body)[0]['exist'] == 0) ? ret = false : ret = true;
    //return jsonDecode(response.body)[0];
    return ret;
  } else {
    throw Exception('Failed to load user_check details');
  }
}
