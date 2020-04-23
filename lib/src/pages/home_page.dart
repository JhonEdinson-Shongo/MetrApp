import 'package:flutter/material.dart';
import 'package:MetrApp/src/pages/home_menuPage.dart';


class HomePage extends StatefulWidget{

  

  @override
  createState() => _HomePage();
  }

  class _HomePage extends State<HomePage>{
  
  //Creamos una variable de tipo TextStyle para los textos del Home
  final TextStyle styleHomeTitulo = new TextStyle(fontSize: 25, height: 2);
  final TextStyle styleHomeParrafo = new TextStyle(fontSize: 15, height: 2);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MetrApp"),
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        centerTitle: true,
      ),
    
      body: SingleChildScrollView(
        child: Container(              
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,                  
              children: <Widget>[
                Text("Bienvenido a MetrApp", style: styleHomeTitulo),
                Text("tu aplicacion para rutas de Metrolinea", textAlign: TextAlign.center, style: styleHomeParrafo,),
                Text("MetrApp nos mueve", textAlign: TextAlign.center, style: styleHomeParrafo,),
                SizedBox(height: 15.0,),
                Divider(),
                Image(
                  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/flutter-firebase-e4f31.appspot.com/o/Logometrapp.png?alt=media&token=b216ce73-c877-459f-aaad-0cc016e67984')
                ),
                Divider(),
                Text("MISION", style: styleHomeTitulo),
                Text("La Mision de MetrApp es informar a los usuarios de Metrolinea de Bucaramanga y su area metropolitana, sobre las rutas de este medio de transporte masivo e informar sobre las noticias o eventos relacionados con esta entidad.", textAlign: TextAlign.justify, style: styleHomeParrafo,),
                Divider(),
                Text("VISION", style: styleHomeTitulo),
                Text("Llegar a informar a los usuarios del área metropolitana en el año 2020, y ser una aplicación con impacto y reconocida, donde todos los usuarios la utilicen al máximo, ofreciendo calidad al servicio masivo de transporte.", textAlign: TextAlign.justify, style: styleHomeParrafo,),
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