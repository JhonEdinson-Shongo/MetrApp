import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Noticias extends StatelessWidget {

  
  final TextStyle styleHomeTitulo = new TextStyle(fontSize: 25, height: 2);
  final TextStyle styleHomeParrafo = new TextStyle(fontSize: 15, height: 1.3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias MetrApp"), 
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),      
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('noticias').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: Column(     
                mainAxisAlignment: MainAxisAlignment.center,           
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 15.0,),
                  Text("Cargando..."),
                ],
              )
            );
          }
          return _listarNoticias(snapshot);
        },
      ),
    );
  }

  //metodo para cargar las rutas
  ListView _listarNoticias(AsyncSnapshot<QuerySnapshot> snapshot){
    List<DocumentSnapshot> docs = snapshot.data.documents;
    return ListView.builder(
      itemCount: docs.length,      
      itemBuilder: (context, index){
        Map<String, dynamic> data = docs[index].data;
        return Column(                
          children: <Widget>[
            SizedBox(height: 15.0,),
            Divider(),
            Text(data['titulo'], style: styleHomeTitulo,),
            Divider(),
            Text(data['contenido'], style: styleHomeParrafo, textAlign: TextAlign.center,),
            //Image(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutter-firebase-e4f31.appspot.com/o/12230931_862120450569599_230996021_n.jpg?alt=media&token=96ebdd03-5bff-4c98-8d35-ce9b64eccd00"))
          ],
        );
      }
    );
  }

}                
