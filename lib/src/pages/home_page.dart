import 'package:flutter/material.dart';
import 'package:flutterapp/src/pages/home_menuPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget{

  

  @override
  createState() => _HomePage();
  }

  class _HomePage extends State<HomePage>{
  
  //Creamos una variable de tipo TextStyle para los textos del Home
  final TextStyle styleHomeTitulo = new TextStyle(fontSize: 25, height: 2);
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("MetrApp"),
            backgroundColor: Color.fromRGBO(39, 99, 52, 1),
            centerTitle: true,
          ),
          body:Center(
            child: Container(              
              child:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[   
                    Text("Bienvenido a MetrApp", style: styleHomeTitulo),
                    Text("tu aplicacion para rutas de Metrolinea"),
                    SizedBox(height: 15.0,),
                    Text("NOTICIAS METROLINEA"),                         
                    Text("En este apartado encontraras las noticias mas importantes para que estes al día", textAlign: TextAlign.center,),
                    SizedBox(height: 10.0,),
                    Divider(),
                  ],
                ),
              ),
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