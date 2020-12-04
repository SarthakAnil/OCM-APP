import '../config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

putEvent(String eventId, String userid, String batchId, String eventName,
    String eventDesc) async {
  final response = await http.post(
    BASE_URL + '/put_events',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        "batch_id": batchId,
        "event_desc": eventDesc,
        "event_id": eventId,
        "event_name": eventName,
        "userid": userid
      },
    ),
  );
  if (response.statusCode == 200) {
    print("event added");
  } else {
    throw Exception('Failed to load File details');
  }
}
