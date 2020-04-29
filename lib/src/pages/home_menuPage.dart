import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget {
  MenuOptions({this.tipomenu});
  String tipomenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"), 
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection(tipomenu.toString()).snapshots(),
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
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(data['tipomenu']),
              leading:  Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.pushNamed(context, data['path'], arguments: tipomenu),
            ),
            Divider(thickness: 1.0,),
          ],
        );
      }
    );
  }
}