import 'package:flutter/material.dart';
import 'package:MetrApp/src/pages/home_menuPage.dart';


class HomePage extends StatefulWidget{
  HomePage({this.tipomenu});  
  String tipomenu = "menu";

  @override
  createState() => _HomePage(tipomenu: tipomenu);
  }

  class _HomePage extends State<HomePage>{
  _HomePage({this.tipomenu});
  String tipomenu;


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
                Divider(),
                SizedBox(height: 10.0,),
                Text("Desarrolladores", textAlign: TextAlign.justify, style: styleHomeTitulo,),
                Card(
                  elevation: 10.0,
                  margin: EdgeInsets.all(14.0),
                  child: Container(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/flutter-firebase-e4f31.appspot.com/o/foto.jpg?alt=media&token=79a1e1a9-6173-4b33-b8fd-c4bf6eafea58",
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          "JHON EDINSON CASTAÑEDA OVIEDO",
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          "Estudiante de ingenieria de sistemas de 9° semestre. Desarrollador del aplicativo MetrApp",
                          style: Theme.of(context).textTheme.subhead,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Card(
                  elevation: 10.0,
                  margin: EdgeInsets.all(14.0),
                  child: Container(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/flutter-firebase-e4f31.appspot.com/o/35edaa5e-13b1-4b7e-99a9-f4b9f5fc310d.jpg?alt=media&token=08ebbd9c-f851-4854-b9a6-8a1d8465fd08",                          
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          "JUAN CAMILO LUNA FLOREZ",
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          "Estudiante de ingenieria de sistemas de 9° semestre. Desarrollador del aplicativo MetrApp",
                          style: Theme.of(context).textTheme.subhead,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),                
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.toc, size: 50,),
        backgroundColor: Color.fromRGBO(196, 213, 77, 1),  

        onPressed: () => Navigator.pushNamed(context, 'menu', arguments: tipomenu),
        /* 
        onPressed:(){
          final route = MaterialPageRoute(
            builder: (context) {
              return MenuOptions();
            }
          );
          Navigator.push(context, route);          
        },*/
      ),

    );     
  }  
}