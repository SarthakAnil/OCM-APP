import '../config.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<FetchEvents> fetchEventsFromJson(String str) => List<FetchEvents>.from(
    json.decode(str).map((x) => FetchEvents.fromJson(x)));

String fetchEventsToJson(List<FetchEvents> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchEvents {
  FetchEvents({
    this.batchId,
    this.eventDesc,
    this.eventId,
    this.eventName,
    this.userid,
  });

  String batchId;
  String eventDesc;
  String eventId;
  String eventName;
  String userid;

  factory FetchEvents.fromJson(Map<String, dynamic> json) => FetchEvents(
        batchId: json["batch_id"],
        eventDesc: json["event_desc"],
        eventId: json["event_id"],
        eventName: json["event_name"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "batch_id": batchId,
        "event_desc": eventDesc,
        "event_id": eventId,
        "event_name": eventName,
        "userid": userid,
      };
}

Future<List<FetchEvents>> fetchEvents(String usrID) async {
  final response = await http.post(
    BASE_URL + '/get_events',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'usrID': usrID},
    ),
  );
  if (response.statusCode == 200) {
    var returnData = fetchEventsFromJson(response.body);
    return returnData;
  } else {
    throw Exception('Failed to load File details');
  }
}
