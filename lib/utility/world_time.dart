import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDay;

  WorldTime({this.location, this.time, this.flag, this.url});

  Future<void> getTime() async{
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/Africa/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      int offset = data['raw_offset'];
//
//    print(datetime);
//    print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: offset));

      isDay = now.hour > 6 && now.hour < 6 ? true : false;
      time = DateFormat.jm().format(now);


    }
    catch (e){
      print(e);
      time = 'could not get time';
    }
  }

}