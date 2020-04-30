import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class PageVIP extends StatefulWidget {
  PageVIP({this.tipomenu});
  String tipomenu = "menu";

  @override
  _PageVIPState createState() => _PageVIPState(tp: tipomenu);
}

class _PageVIPState extends State<PageVIP> {
  _PageVIPState({this.tp});
  String tp;
  String _codigo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Icon alerta = Icon(
    Icons.dialpad,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    print(tp);
    if(tp == "menu"){
      return Scaffold(
        appBar: AppBar(
          title: Text("Ingreso VIP"),
          backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        ),
        body: Stack(
          children: <Widget>[
            _crearFondo(context),
            _codigoForm(context),
          ],
        )
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Ingreso VIP"),
          backgroundColor: Color.fromRGBO(39, 99, 52, 1),
        ),
        body: Stack(          
          children: <Widget>[
            _crearFondo(context),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox( height: 30.0 ),
                  RaisedButton(                                  
                    child: Container(
                      padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),                
                      child: Text("cerrar sesion"),                
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    elevation: 0.0,
                    color: Color.fromRGBO(39, 99, 52, 1),
                    textColor: Colors.white,              
                    onPressed: (){
                      Navigator.pushNamed(context, "home", arguments: "menu");
                    },
                  ),
                ],
              ),
            ),            
          ],
        ),
      );
    }
    
  }

  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(183, 213, 77, 1),
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
              Text('Este apartado es para los Administradores donde podran agregar nuevas noicias a la App', style: TextStyle( color: Colors.white, fontSize: 15.0),textAlign: TextAlign.center)
            ],
          ),
        )

      ],
    );

  }

  Widget _codigoForm(BuildContext context){
  final size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            height: size.height * 0.3,
          )
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
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    ////// text codigo //////
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child:TextFormField(
                        validator: (input){
                          if(input.isEmpty){
                            return 'Ingrese un codigo.';
                          }
                        },
                        onSaved: (input) => _codigo = input,
                        decoration: InputDecoration(
                          icon: alerta,
                          labelText: 'Codigo',
                          hintText: 'Ej: codigoVIP',
                        ),
                        obscureText: true,
                      ),
                    ),
                    Divider(),
                    SizedBox( height: 30.0 ),
                    ////// Boton //////
                    RaisedButton(
                      child: Container(
                        padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
                        child: Text("Validar"),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      elevation: 0.0,
                      color: Color.fromRGBO(9, 99, 52, 1),
                      textColor: Colors.white,
                      onPressed: validaCodigo,
                    ),
                  ],
                ),
              ),       
            ],
          ),
        ),
      ],
    ),
  );
  }

  void validaCodigo(){
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        DatabaseReference _codigoRef = FirebaseDatabase.instance.reference().child("CodigoVIP");
        _codigoRef.once().then((DataSnapshot snap){
          var data = snap.value;
          if(data[1]['codigo'].toString() == _codigo.toString()){
            Navigator.pushNamed(context, 'home', arguments: data[1]['tipomenu'].toString());
          }else{
            setState(() {              
              alerta = Icon(Icons.error_outline, color: Colors.red,);
            });
          }
        });
      }catch(e){
        print("ERROR ------------------******** $e");
      }      
    }
    
  }
}