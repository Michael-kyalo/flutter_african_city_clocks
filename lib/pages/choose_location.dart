import 'package:flutter/material.dart';
import 'package:fluttercityclocks/utility/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag:'ivorycoast.png' ),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag:'egypt.png' ),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag:'southafrica.png' ),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag:'nigeria.png' ),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag:'kenya.png' ),

  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];

    await instance.getTime();
    print(instance);
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay

    });
  }


  @override
  Widget build(BuildContext context) {
    print('build state function ran');

    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        title: Text('Cities'),
        backgroundColor: Colors.red[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location, style:
                TextStyle(
                  fontFamily: 'locust',
                  fontSize: 18.0,
                ),),

            ),
          );
        },
      ),

    );
  }
}
