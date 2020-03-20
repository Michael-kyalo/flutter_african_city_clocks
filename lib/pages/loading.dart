import 'package:flutter/material.dart';
import 'package:fluttercityclocks/utility/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Abidjan', flag: 'germany.png', url: 'Abidjan');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay
    }
    );
  }
  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitCubeGrid(
                color: Colors.white,
                size: 90.0,

              ),
              SizedBox(height: 30.0,),
              Text(
                'loading time',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[100],
                  fontFamily: 'lobster'
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

