import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodigoVIP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodigoVIP"),
        backgroundColor: Color.fromRGBO(39, 99, 52, 1),
      ),
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context)
        ],
      )
    );
  }

  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(180, 213, 77, 1),
            Color.fromRGBO(180, 213, 77, 1)
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(0, 0, 0, 0.05)
      ),
    );


    return Stack(
      children: <Widget>[
        fondo,
        Positioned( top: 90.0, left: 30.0, child: circulo ),
        Positioned( top: -40.0, right: -30.0, child: circulo ),
        Positioned( bottom: -50.0, right: -10.0, child: circulo ),
        Positioned( bottom: 120.0, right: 20.0, child: circulo ),
        Positioned( bottom: -50.0, left: -20.0, child: circulo ),
        
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon( Icons.person_pin_circle, color: Colors.white, size: 100.0 ),
              SizedBox( height: 10.0, width: double.infinity ),
              Text('Codigo VIP', style: TextStyle( color: Colors.white, fontSize: 25.0 )),
              Text('En este apartado lo que queremos es generar un token para saber si es admin o no', style: TextStyle( color: Colors.white, fontSize: 15.0),textAlign: TextAlign.center)
            ],
          ),
        )

      ],
    );

  }

  Widget _loginForm(BuildContext context) {

    //final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: size.height * 0.40,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingresa tu codigo VIP', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 30.0 ),
                _crearEmail(),
                SizedBox( height: 30.0 ),
                _crearBoton(),
              ],
            ),
          ),
          SizedBox( height: 100.0 )
        ],
      ),
    );


  }

  Widget _crearEmail() {

    return StreamBuilder(
      //stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon( Icons.dialpad, color: Colors.black ),
              hintText: 'Ej: SWFGE34213FDDS',
              labelText: 'Codigo VIP',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
          //onChanged: bloc.changeEmail,
          ),

        );
      },
    );


  }

  Widget _crearBoton() {

    return StreamBuilder(      
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Color.fromRGBO(9, 99, 52, 1),
          textColor: Colors.white,          
          onPressed: () => Navigator.pushNamed(context, 'home'),
          //onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
        );
      },
    );
  }

}
