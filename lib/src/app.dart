import 'package:MetrApp/src/pages/home_pageNews.dart';
import 'package:MetrApp/src/CodigoVIP/panel_Admin.dart';
import 'package:flutter/material.dart';

import 'package:MetrApp/src/pages/home_map.dart';
import 'package:MetrApp/src/pages/home_page.dart';
import 'package:MetrApp/src/CodigoVIP/pageVIP.dart';

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
        'noticias' : (BuildContext context) => PageNoticias(),
        'panelAdmin' : (BuildContext context) => Panel_Admin(),
      },      
    );
  }
}