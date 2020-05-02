import 'package:MetrApp/src/providers/MapaR.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:MetrApp/src/providers/MapaR.dart';


class Mapa extends StatefulWidget {
  Mapa({this.data});
  MapaR data;
  
  @override
  State<StatefulWidget> createState() => _Mapa(doc: data);
}

class _Mapa extends State<Mapa> {
  _Mapa({this.doc});
  MapaR doc;

  @override
  void initState() { 
    super.initState();
    setState(() {
      _loadRoutes();
    });
    
  }

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(7.059710, -73.090407);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.hybrid;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position,) {
    _lastMapPosition = position.target;
  }


  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }


  //metodo para poner los puntos de las rutas...
  void _onAddMarkerButtonPressed(String time,LatLng coord, String nombre){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: coord,
        infoWindow: InfoWindow(
          title: nombre,
          snippet: "La ruta toma un tiempo de: $time"
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _loadRoutes(){
    for(var index in doc.rutas){
      List coor = index.toString().split(", ");      
      LatLng coord = LatLng(double.parse(coor[0]), double.parse(coor[1]));
      _onAddMarkerButtonPressed(doc.tiempo, coord, doc.nombre);
      _nextCoord(coord);
    }
  }

 void _nextCoord(LatLng position,) {
    _lastMapPosition = position;
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Color.fromRGBO(196, 213, 77, 1),
      child: Icon(
        icon,
        color: Colors.white,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[            
            Text("MetrApp", textAlign: TextAlign.center,),
            SizedBox(width: MediaQuery.of(context).size.width*0.3,),
            Text(("Ruta: "+doc.nombre), textAlign: TextAlign.end,),
          ],
        ) ,
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
          ),
          mapType: _currentMapType,
          markers: _markers,
          onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  button(_onMapTypeButtonPressed,Icons.map),               
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
