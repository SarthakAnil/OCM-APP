import '../config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// To parse this JSON data, do
//
//     final fetchTt = fetchTtFromJson(jsonString);

FetchTt fetchTtFromJson(String str) => FetchTt.fromJson(json.decode(str));

String fetchTtToJson(FetchTt data) => json.encode(data.toJson());

class FetchTt {
  FetchTt({
    this.friday,
    this.monday,
    this.thursday,
    this.tuesday,
    this.wednesday,
  });

  List<Day> friday;
  List<Day> monday;
  List<Day> thursday;
  List<Day> tuesday;
  List<Day> wednesday;

  factory FetchTt.fromJson(Map<String, dynamic> json) => FetchTt(
        friday: List<Day>.from(json["FRIDAY"].map((x) => Day.fromJson(x))),
        monday: List<Day>.from(json["MONDAY"].map((x) => Day.fromJson(x))),
        thursday: List<Day>.from(json["THURSDAY"].map((x) => Day.fromJson(x))),
        tuesday: List<Day>.from(json["TUESDAY"].map((x) => Day.fromJson(x))),
        wednesday:
            List<Day>.from(json["WEDNESDAY"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "FRIDAY": List<dynamic>.from(friday.map((x) => x.toJson())),
        "MONDAY": List<dynamic>.from(monday.map((x) => x.toJson())),
        "THURSDAY": List<dynamic>.from(thursday.map((x) => x.toJson())),
        "TUESDAY": List<dynamic>.from(tuesday.map((x) => x.toJson())),
        "WEDNESDAY": List<dynamic>.from(wednesday.map((x) => x.toJson())),
      };
}

class Day {
  Day({
    this.courseDesc,
    this.courseId,
    this.courseName,
    this.day,
    this.firstName,
    this.hourId,
    this.lastName,
    this.middleName,
    this.tableId,
    this.teacherEmail,
    this.teacherMobile,
    this.userid,
  });

  String courseDesc;
  String courseId;
  String courseName;
  String day;
  String firstName;
  int hourId;
  String lastName;
  dynamic middleName;
  String tableId;
  String teacherEmail;
  int teacherMobile;
  String userid;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        courseDesc: json["course_desc"],
        courseId: json["course_id"],
        courseName: json["course_name"],
        day: json["day"],
        firstName: json["first_name"],
        hourId: json["hour_id"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        tableId: json["table_id"],
        teacherEmail: json["teacher_email"],
        teacherMobile: json["teacher_mobile"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "course_desc": courseDesc,
        "course_id": courseId,
        "course_name": courseName,
        "day": day,
        "first_name": firstName,
        "hour_id": hourId,
        "last_name": lastName,
        "middle_name": middleName,
        "table_id": tableId,
        "teacher_email": teacherEmail,
        "teacher_mobile": teacherMobile,
        "userid": userid,
      };
}

fetchTT(String batchID) async {
  final response = await http.post(
    BASE_URL + '/get_time_Table',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'batchID': batchID},
    ),
  );
  // print(response.body);
  if (response.statusCode == 200) {
    var returnData = fetchTtFromJson(response.body);

   // print(returnData.monday.length);
    return returnData;
  } else {
    throw Exception('Failed to load File details');
  }
}
