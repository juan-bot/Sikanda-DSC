//import 'dart:ffi';

import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanadorRompecabezas.dart';

class BuscaObjeto extends StatefulWidget {
  final List<String> imagenes;
  final String imgcorrecta;
  final String objeto;
  const BuscaObjeto(
      {this.objeto,  this.imgcorrecta,  this.imagenes})
      : super();

  @override
  _BuscaObjetoState createState() => _BuscaObjetoState();
}

class _BuscaObjetoState extends State<BuscaObjeto> {
  List<Widget> objetos = [];
  bool acertado = false;
  bool listo = false;
  void carga(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width / 4;
    widget.imagenes.forEach((element) {
      objetos.add(
          // Aqui es donde tienes que ver como animarlo
          GestureDetector(
        child: Container(
          child: Column(
            children: [
              Container(
                width: ancho,
                height: ancho,
                child: FittedBox(child: Image.asset(element.split("--")[0])),
              ),
              Container(
                width: ancho,
                child: Text(
                  element.split("--")[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(border: Border.all(width: 1)),
        ),
        onTap: () {
          setState(() {
            acertado = element.split("--")[1] == widget.imgcorrecta;
            if(!acertado)
            show(context, "Intentalo de nuevo", Colors.red[200], "images/confundido.png");
          });
        },
      )
          // aqui termina todo
          );
    });
    setState(() {
      listo = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listo ? listo = true : carga(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9D2929),
        title: Text(
          'Sikanda',
          style: TextStyle(
            fontFamily: "Love",
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.help_outline,
              size: 40,
            ),
            tooltip: 'Ver instrucciones',
            onPressed: () {
              // UI with the changes.
              _showMyDialog();
            },
          )
        ],
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(child:Text(
              'Encuentra ' + widget.objeto ,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),)
        ]),
        acertado
            ? Center(
                child: Ganador()
                  
              )
            : Wrap(
                direction: Axis.horizontal,
                spacing: 15.0,
                runSpacing: 15.0,
                children: objetos,
              )
      ],
    ));
  }
  Future<void> _showMyDialog() async {
  //  AudioCache cache;
    //cache = AudioCache(fixedPlayer: reproduceInstrucciones);
   // cache.loop(intruccionesAux[3]);
    //auxAudioInstrucciones=true;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Instrucciones'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
              //  Text(instrucciones[3]),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('cerrar'),
              onPressed: () {
               // auxAudioInstrucciones=false;
                //reproduceInstrucciones.stop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void show(BuildContext context, String msj, Color col, String img) {
    AchievementView(
      context,
      icon: Image.asset(img),
      color: col,
      title: msj,
      subTitle: " ",
      textStyleTitle: TextStyle(fontSize: 25,),
      isCircle: true,
      listener: (status) {
        print(status);
      },
    )..show();
  }

}


