import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  String time = '';
  bool isDayTime = false;

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

    Map data = jsonDecode(response.body);
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'];

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset.substring(1,3))));

    isDayTime = (now.hour > 6) & (now.hour < 20);
    time = DateFormat.jm().format(now);
  }
}