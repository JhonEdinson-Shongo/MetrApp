import 'package:flutter/material.dart';

import 'package:flutterapp/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(context){

    var materialApp = MaterialApp(
          home: Center(
            child: HomePage(),
            ),
        );
        return materialApp;
  }
}