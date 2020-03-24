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
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('rutas').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          List<DocumentSnapshot> docs = snapshot.data.documents;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index){
              Map<String, dynamic> data = docs[index].data;
              return ListTile(
                title: Text(data['categoria']),
              );
            }
            );
        },
      ),
    );
  }
}