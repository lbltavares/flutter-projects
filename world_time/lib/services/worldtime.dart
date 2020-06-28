import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeService {
  String location; // location name for the ui
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTimeService({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Make the request:
      String endpoint = 'http://worldtimeapi.org/api/timezone/$url';
      Response response = await get(endpoint);
      Map data = jsonDecode(response.body);

      // Get properties from data:
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      // Create DateTime object:
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property:
      isDaytime = now.hour >= 6 && now.hour <= 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (ex) {
      time = 'could not get time data';
    }
  }
}
