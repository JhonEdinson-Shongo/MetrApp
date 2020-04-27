import 'package:firebase_database/firebase_database.dart';

class MapaR {
  String _nombre;
  String _dom_fes;
  String _sab;
  String _lun_vie;
  String _tiempo;
  List _rutas;
  
  MapaR(this._nombre, this._dom_fes, this._lun_vie, this._sab, this._tiempo,this._rutas);

  MapaR.map(dynamic obj){
    this._nombre = obj['nombre'];
    this._dom_fes = obj['domFes'];
    this._sab = obj['horarioS'];
    this._lun_vie = obj['horarioLV'];
    this._tiempo = obj['tiempo'];
    this._rutas = obj['ruta'];
  }

  String get nombre => _nombre;
  String get dom_fes => _dom_fes;
  String get sab => _sab;
  String get lun_vie => _lun_vie;
  String get tiempo => _tiempo;
  List get rutas => _rutas;

  MapaR.fromSnapshot(DataSnapshot snapshot){
    _nombre = snapshot.value['nombre'];
    _dom_fes = snapshot.value['domFes'];
    _sab = snapshot.value['horarioS'];
    _lun_vie = snapshot.value['horarioLV'];
    _tiempo = snapshot.value['tiempo'];
    _rutas = snapshot.value['ruta'];
  }
}