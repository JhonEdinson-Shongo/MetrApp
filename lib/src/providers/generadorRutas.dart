import 'package:MetrApp/src/CodigoVIP/Page_VIP.dart';
import 'package:MetrApp/src/CodigoVIP/panel_Admin.dart';
import 'package:MetrApp/src/pages/home_pageRutas.dart';
import 'package:flutter/material.dart';

import 'package:MetrApp/src/pages/home_menuPage.dart';
import 'package:MetrApp/src/pages/home_page.dart';
import 'package:MetrApp/src/pages/home_pageNews.dart';

class GeneradorRutas{
  static Route<dynamic> generarrutas(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage(tipomenu: "menu"));

      case 'home':
        if(args is String){
          return MaterialPageRoute(
            builder: (_) => HomePage(tipomenu: args,),
          );
        }
        return _errorRoute();
        
      case 'codigoVIP':
        if(args is String){
          return MaterialPageRoute(
            builder: (_) => PageVIP(tipomenu: args,),
          );
        }
        return _errorRoute();

      case 'menu':
        if(args is String){
          return MaterialPageRoute(
            builder: (_) => MenuOptions(tipomenu: args,),
          );
        }
        return _errorRoute();
      case 'noticias':
        return MaterialPageRoute(builder: (_) => PageNoticias());
      
      case 'rutas':
      return MaterialPageRoute(builder: (_) => RutasA());
      
      case 'panelAdmin':
        return MaterialPageRoute(builder: (_) => Panel_Admin());
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
          backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        ),
        body: Text("Sucedio un error inesperado."),
      );
    });
  }
}