import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

Future<String> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString('user_name');
  return stringValue;
}

Future<String> getUserInfo(String para) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString(para);
  return stringValue;
}

Future getUserData(String usrName) async {
  var response = await http.post(
    BASE_URL + '/get_user_data',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'usrName': usrName},
    ),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)[0];
  } else {
    throw Exception('Failed to load user_check details');
  }
}

Future setUserData(String usrName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var value = await getUserData(usrName);

  prefs.setString('Name', value['Name']);
  prefs.setString('batch_id', value['batch_id']);
  prefs.setString('email', value['email']);
  prefs.setString('role_name', value['role_name']);
  prefs.setString('userid', value['userid']);
  prefs.setString('user_name', value['login_username']);
  prefs.setString('role_id', value['role_id'].toString());
}

changeServerpass(String password) async {
  final usrName = await getUsername();
  var response = await http.post(
    BASE_URL + '/change_pass',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'usrName': usrName,
        'pass': password,
      },
    ),
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body)[0];
  } else {
    throw Exception('Failed to load user_check details');
  }
}
