import 'package:flutter/material.dart';
import 'package:flutterapp/src/pages/home_menuPage.dart';


class HomePage extends StatefulWidget{
  @override
  createState() => _HomePage();
  }

  class _HomePage extends State<HomePage>{
  
  //Creamos una variable de tipo TextStyle para los textos del Home
  final TextStyle styleHomeTitulo = new TextStyle(fontSize: 40, height: 2);
  final TextStyle styleHomeSubTitulo = new TextStyle(fontSize: 25);

  

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("MetrApp"),
            backgroundColor: Color.fromRGBO(39, 99, 52, 1),
            centerTitle: true,
          ),
          body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Text("Bienvenido a MetrApp", style: styleHomeTitulo),
                Divider(),
                Text("tu aplicacion para rutas de Metrolinea", style: styleHomeSubTitulo,),
              ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.toc, size: 50,),
        backgroundColor: Color.fromRGBO(196, 213, 77, 1),   
        onPressed: (){
          final route = MaterialPageRoute(
            builder: (context) {
              return MenuOptions();
            }
          );
          Navigator.push(context, route);
        },
      ),

    );
  }
}