import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:MetrApp/src/providers/noticias.dart';

class PageNoticias extends StatefulWidget {

    @override
  _PageNoticiasState createState() => _PageNoticiasState();
}

class _PageNoticiasState extends State<PageNoticias>{
  List<Noticias> noticiasList = [];

  @override
  void initState() { 
    super.initState();
    DatabaseReference noticiasRef = FirebaseDatabase.instance.reference().child("Noticias");
    noticiasRef.once().then((DataSnapshot snap){
      var keys = snap.value.keys;
      var data = snap.value;
      noticiasList.clear();

      for(var individualKey in keys){
        Noticias noticias = Noticias(
          data[individualKey]['image'],
          data[individualKey]['titulo'],
          data[individualKey]['contenido'],
          data[individualKey]['date'],
          data[individualKey]['time']
        );
        noticiasList.add(noticias);
      }

      setState((){
        noticiasList.length;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias MetrApp"), 
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),      
      ),
      body: Container(
        child: noticiasList.length == 0
        ? Text("No hay noticias disponibles")
        : ListView.builder(
          itemCount: noticiasList.length,
          itemBuilder: (BuildContext context, int index) {
          return noticiasUI(
            noticiasList[index].image,
            noticiasList[index].titulo,
            noticiasList[index].contenido,
            noticiasList[index].date,
            noticiasList[index].time,
          );
         },
        ),
      ),
    );
  }

  Widget noticiasUI(String img, String titulo, String contenido, String date, String time){
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Image.network(
              img,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0,),
            Text(
              titulo,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            Text(
              contenido,
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

}                
