import 'package:flutter/material.dart';
//import 'package:flutterapp/src/Widgets/widgets.dart';

import 'package:flutterapp/src/CodigoVIP/pageVIP.dart';
import 'package:flutterapp/src/pages/home_map.dart';
import 'package:flutterapp/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'paso esto',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'codigoVIP' : (BuildContext context) => CodigoVIP(),
        'mapa' : (BuildContext context) => Mapa(),
      },      
    );
  }
}