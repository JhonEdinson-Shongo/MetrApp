import 'package:MetrApp/src/providers/MapaR.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:MetrApp/src/pages/home_menuPage.dart';
import 'package:MetrApp/src/pages/home_pageNews.dart';
import 'package:MetrApp/src/CodigoVIP/panel_Admin.dart';
import 'package:MetrApp/src/pages/home_pageRutas.dart';
import 'package:MetrApp/src/pages/home_map.dart';
import 'package:MetrApp/src/pages/home_page.dart';
import 'package:MetrApp/src/CodigoVIP/pageVIP.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'codigoVIP' : (BuildContext context) => CodigoVIP(),
        //'mapa' : (BuildContext context) => Mapa(),                
        'noticias' : (BuildContext context) => PageNoticias(),
        'panelAdmin' : (BuildContext context) => Panel_Admin(),
        'rutas' : (BuildContext context) => RutasA(),
        'menu' : (BuildContext context) => MenuOptions(),
      },      
    );
  }
}