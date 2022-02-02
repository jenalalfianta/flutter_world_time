import 'package:http/http.dart';
import 'dart:convert';

class World_Time {
  String location;
  late String time2;
  String flag;
  String url;

  World_Time({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/' + url));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time2 = now.toString();
    } catch (e) {
      print(e);
      print(time2 = 'could not get time data');
    }
  }
}
