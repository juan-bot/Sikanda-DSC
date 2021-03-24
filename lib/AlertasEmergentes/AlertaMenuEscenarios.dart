import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constantes.dart';
import '../ContenidoIdioma/Intrucciones.dart';
import '../escenarios.dart';

class Escenario extends StatefulWidget {
  final String title;
  Escenario({Key key, this.title}) : super(key: key);
  @override
  Instruccion createState() => Instruccion();
}

class Instruccion extends State<Escenario> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9D2929),
          title: Text('Sikanda',
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Love",
              color: Colors.white,
              letterSpacing: 0.5,
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
                child: SizedBox(height:MediaQuery.of(context).size.height*2 , child: RadialExpansionDemo());
                _showMyDialog();
              },
            )
          ],
        ),
        //body:RadialExpansionDemo(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(height:MediaQuery.of(context).size.height*1.5, child: RadialExpansionDemo()),
        )
    );
  }
  Future<void> _showMyDialog() async {
    AudioCache cache;
    cache = AudioCache(fixedPlayer: reproduceInstrucciones);
    cache.loop(intruccionesAux[0]);
    auxAudioInstrucciones=true;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Instrucciones'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(instrucciones[0]),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('cerrar'),
              onPressed: () {
                auxAudioInstrucciones=false;
                reproduceInstrucciones.stop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}