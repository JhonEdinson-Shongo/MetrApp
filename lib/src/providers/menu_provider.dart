
import 'package:mongo_dart/mongo_dart.dart';


class _Conexion{

  List<dynamic> lista = [];
  
  _Conexion(){
    consultaMenu();
  }

  consultaMenu() async{
    Db db = new Db("mongodb://localhost:27017/flutter");
    await db.open();
    DbCollection coll = db.collection('menus');
    var people = await coll.find().toList();

    print(people);
    
    db.close();
  }

}

final conexion = new _Conexion();