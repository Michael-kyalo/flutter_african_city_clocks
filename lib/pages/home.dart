import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String image = data['isDay'] ? 'da.jpg' : 'nigh.jpg';


    return Scaffold(

      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$image'),
                fit: BoxFit.cover
              )
            ),
            child: Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 150.0,right: 20.0, left: 20.0),
            child: Column(

              children: <Widget>[
                FlatButton.icon(onPressed: () async{

                  dynamic results = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' :results['time'],
                      'location' : results['location'],
                      'isDay' : results['isDay'],
                      'flag' : results['flag']

                    };
                  });
                }, icon: Icon(Icons.edit_location,
                    color: data['isDay'] == false ? Colors.white: Colors.black), label: Text('Change city',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'lobster',
                    color: data['isDay'] == false ? Colors.white: Colors.black

                ),)),

                Divider(height: 15.0, color: Colors.red[700],),
                SizedBox(height: 15.0,),
                Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'lobster',
                      color: data['isDay'] == false ? Colors.white: Colors.black
                    )
                ),
                SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'lobster', color: data['isDay'] == false ? Colors.white: Colors.black
                        ),
                      ),

                    ],
                  ),
                ),






              ],
            ),
        ),
      ),
          )
      ),
    );
  }
}