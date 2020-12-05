import '../config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// To parse this JSON data, do
//
//     final getTeacherTt = getTeacherTtFromJson(jsonString);

GetTeacherTt getTeacherTtFromJson(String str) =>
    GetTeacherTt.fromJson(json.decode(str));

String getTeacherTtToJson(GetTeacherTt data) => json.encode(data.toJson());

class GetTeacherTt {
  GetTeacherTt({
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

  factory GetTeacherTt.fromJson(Map<String, dynamic> json) => GetTeacherTt(
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
    this.batch,
    this.batchId,
    this.courseDesc,
    this.courseId,
    this.courseName,
    this.day,
    this.discipline,
    this.hourId,
    this.semester,
    this.tableId,
    this.userid,
  });

  String batch;
  String batchId;
  String courseDesc;
  String courseId;
  String courseName;
  String day;
  String discipline;
  int hourId;
  int semester;
  String tableId;
  String userid;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        batch: json["batch"],
        batchId: json["batch_id"],
        courseDesc: json["course_desc"],
        courseId: json["course_id"],
        courseName: json["course_name"],
        day: json["day"],
        discipline: json["discipline"],
        hourId: json["hour_id"],
        semester: json["semester"],
        tableId: json["table_id"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "batch": batch,
        "batch_id": batchId,
        "course_desc": courseDesc,
        "course_id": courseId,
        "course_name": courseName,
        "day": day,
        "discipline": discipline,
        "hour_id": hourId,
        "semester": semester,
        "table_id": tableId,
        "userid": userid,
      };
}

fetchTeacherTT(String usrID) async {
  final response = await http.post(
    BASE_URL + '/get_teacher_TT',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'usrID': usrID},
    ),
  );
  // print(response.body);
  if (response.statusCode == 200) {
    var returnData = getTeacherTtFromJson(response.body);

    // print(returnData.monday.length);
    return returnData;
  } else {
    throw Exception('Failed to load File details');
  }
}
