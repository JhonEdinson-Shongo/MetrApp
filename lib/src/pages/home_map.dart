import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Mapa extends StatefulWidget {
  @override
  createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(7.059710, -73.090407);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.hybrid;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 0.0,
    target: LatLng(7.059710, -73.090407),
    tilt: 59.440,
    zoom: 11.0,
  );

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {

      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }


  //metodo para poner los puntos de las rutas...
  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'This is a Title',
          snippet: 'This is a snippet',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
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
        title: Text('MetrApp'),              
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
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
                  //button(_onMapTypeButtonPressed,Icons.map),
                  RaisedButton(
                    elevation: 10.0,
                    child: Icon(Icons.map),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    textColor: Colors.white,
                    color: Color.fromRGBO(196, 213, 77, 1),
                    onPressed: _onMapTypeButtonPressed,
                  ),
                  SizedBox(height: 16.0,),
                  //no se pueden poner mas de un boton flotante.
                  RaisedButton(
                    elevation: 10.0,
                    child: Icon(Icons.add_location),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    textColor: Colors.white,
                    color: Color.fromRGBO(196, 213, 77, 1),
                    onPressed: _onAddMarkerButtonPressed,
                  ),
                  SizedBox(height: 16.0,),                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
