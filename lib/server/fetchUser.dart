import '../config.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<FetchUser> fetchUserFromJson(String str) =>
    List<FetchUser>.from(json.decode(str).map((x) => FetchUser.fromJson(x)));

String fetchUserToJson(List<FetchUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchUser {
  FetchUser({
    this.loginUsername,
    this.roleId,
    this.roleName,
    this.userid,
  });

  String loginUsername;
  int roleId;
  String roleName;
  String userid;

  factory FetchUser.fromJson(Map<String, dynamic> json) => FetchUser(
        loginUsername: json["login_username"],
        roleId: json["role_id"],
        roleName: json["role_name"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "login_username": loginUsername,
        "role_id": roleId,
        "role_name": roleName,
        "userid": userid,
      };
}

Future<List<FetchUser>> fetchUserTable() async {
  final response = await http.get(BASE_URL + '/user_table');
  if (response.statusCode == 200) {
    var returnData = fetchUserFromJson(response.body);
    return returnData;
  } else {
    throw Exception('Failed to load File details');
  }
}
