//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"), 
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),      
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('menuAdmin').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
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
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(data['tipomenu']),
              leading:  Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.pushNamed(context, data['path']),
            ),
            Divider(thickness: 1.0,),
          ],
        );
      }
    );
  }

}