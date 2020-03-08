import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{

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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Bienvenido a MetrApp", style: styleHomeTitulo),
            Text("tu aplicacion para rutas de Metrolinea", style: styleHomeSubTitulo,)
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.toc, size: 50,),
        backgroundColor: Color.fromRGBO(196, 213, 77, 1),
        //aqui debe ir que quiero que haga despues de presionar el boton
        onPressed: (){},
      ),

    );
  }
}