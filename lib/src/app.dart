import 'package:flutter/material.dart';

import 'package:MetrApp/src/providers/generadorRutas.dart';


class MyApp extends StatelessWidget {
  
  @override
  Widget build(context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: GeneradorRutas.generarrutas,  
    );
  }
}