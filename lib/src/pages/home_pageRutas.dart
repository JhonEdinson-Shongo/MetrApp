import 'package:MetrApp/src/pages/home_map.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:MetrApp/src/providers/MapaR.dart';
class RutasA extends StatelessWidget {

  MapaR sendMapa;        

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alimentadores"),
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Alimentadores').snapshots(),
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
          return _listarRutas(snapshot);
        },
      ),
    );
  }

  //metodo para cargar las rutas
  ListView _listarRutas(AsyncSnapshot<QuerySnapshot> snapshot){
    List<DocumentSnapshot> docs = snapshot.data.documents;
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index){
        Map<String, dynamic> data = docs[index].data;
        sendMapa = ModalRoute.of(context).settings.arguments; ///////
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(data['nombre']),
              leading:  Icon(Icons.keyboard_arrow_right),
              onTap: (){
                final route = MaterialPageRoute(
                  builder: (context) {
                    sendMapa = MapaR(data['nombre'], data['donFes'], data['horarioLV'], data['horarioS'], data['tiempo'], data['ruta']);
                    return Mapa(data: sendMapa);
                  }
                );
                Navigator.push(context, route);
              },              
            ),
            Divider(thickness: 1.0,),
          ],
        );
      }
    );
  }
}