import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountries {
  final String flag;
  final String countryName;
  final String link;
  AllCountries(
      {required this.flag, required this.countryName, required this.link});
  late bool isDayTime;
  late String timeNow;
  late String timeZone;
  getData() async {
    Response response =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receivedData = jsonDecode(response.body);

    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
    // print(offset);

    DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);
    // print(datetime);

    DateTime realTime = datetime.add(Duration(hours: offset));

    timeNow = DateFormat('hh:mm a').format(realTime);

    // print(timeNow);

    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    timeZone = receivedData["timezone"];

    // print(timeZone);
  }
}
