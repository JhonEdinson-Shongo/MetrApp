import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
class Panel_Admin extends StatefulWidget {

  @override
  _Panel_AdminState createState() => _Panel_AdminState();
}

class _Panel_AdminState extends State<Panel_Admin> {
  File img;
  String _titulo;
  String _contenido;
  String url;
  final formkey = GlobalKey<FormState>();

  Future getImage() async{
    var tempimg = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      img = tempimg;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panel Noticias"),
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),      
        centerTitle: true,
      ),
      body: Center(
        child: img == null
        ? Padding(padding: const EdgeInsets.all(16.5),
        child: Column(
          children: <Widget>[
            Text("PANEL DE NOTICIAS", style: Theme.of(context).textTheme.title, textAlign: TextAlign.center,),
            SizedBox(height: 16.0,),
            Text("En este panel podra agregar una nueva noticias a la pagina de noticias, este consta de una imagen un titulo y un parrafo de la noticia.",style: Theme.of(context).textTheme.subhead, textAlign: TextAlign.center,),
            SizedBox(height: 20.0,),
            Text("Se requiere que agrege una imagen...", style: Theme.of(context).textTheme.headline, textAlign: TextAlign.center,),
          ],
        ),
        )
        : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        onPressed: getImage,
        tooltip: "Agregar foto",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }


  Widget enableUpload(){
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Image.file(
                  img,
                  height: 300.0,
                  width: 600.0,
                ),

                SizedBox(height: 15.0,),  //separadores

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Titulo de la noticia."
                  ),
                  validator: (value){
                    return value.isEmpty ? "Titulo requerido" : null;
                  },
                  onSaved: (value){
                    return _titulo = value;
                  },
                ),

                SizedBox(height: 15.0,), //separadores

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Contenido de la noticia."
                  ),
                  validator: (value){
                    return value.isEmpty ? "Contenido requerido" : null;
                  },
                  onSaved: (value){
                    return _contenido = value;
                  },
                ),

                SizedBox(height: 20.0,), //separadores

                RaisedButton(
                  elevation: 10.0,
                  child: Text("Agregar Noticia"),
                  textColor: Colors.white,
                  color: Color.fromRGBO(39, 99, 52, 1),
                  onPressed: uploadData,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadData() async {
    if(validacion_Guardar()){
      //subir la imagen a FireBase Storage
      final StorageReference postImg = FirebaseStorage.instance.ref().child("news images");
      var timeKey = DateTime.now();
      final StorageUploadTask uploadTask = postImg.child(timeKey.toString()+".jpg").putFile(img);
      var imgUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      url = imgUrl.toString();

      //Guardar el Post a Firebase database: database realtime
      saveToDatabase(url);
      //Regresar al home
      await Navigator.pushNamed(context,"home");
    }
  }

  void saveToDatabase(String url){
    //Guardar post schema(imagen, titulo, contenido, fecha, hora)
    var dbtimekey = DateTime.now();
    var formatDate = DateFormat('MM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbtimekey);
    String time = formatTime.format(dbtimekey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "image": url,
      "titulo": _titulo,
      "contenido": _contenido,
      "date": date,
      "time": time
    };

    ref.child("Noticias").push().set(data);
  }

  bool validacion_Guardar(){
    final form = formkey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;

  }

}