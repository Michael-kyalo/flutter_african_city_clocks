

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercityclocks/pages/choose_location.dart';
import 'package:fluttercityclocks/pages/home.dart';
import 'package:fluttercityclocks/pages/loading.dart';




void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',

  routes: {
    '/':(context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation()

  },
));

