
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'Constantes.dart';
import 'ContenidoIdioma/Intrucciones.dart';

  AppBar getAppBar(String title, int i, BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF9D2929),
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(title,
      style: TextStyle(
            fontSize: 30,
           // fontFamily: "Love",
            color: Colors.white,
            letterSpacing: 0.5,
          )),
      actions: <Widget>[
          Padding(padding:const EdgeInsets.only(right: 10.0),
          child:IconButton(
            
            icon: Icon(
              Icons.help_outline,
              size: 40,
            ),
            tooltip: 'Ver instrucciones',
            onPressed: () {
              // UI with the changes.
              if(i!=5&& i!=4)
              _showMyDialog(i, context);
              else
              _showMyDialogtext(context, i);
            },
          ))
        ]
    );
  }
// dialog + audio
Future<void> _showMyDialog(int i, BuildContext context ) async {
    AudioCache cache;
    cache = AudioCache(fixedPlayer: reproduceInstrucciones);
    cache.loop(intruccionesAux[i]);
    auxAudioInstrucciones = true;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Instrucciones'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Text(instrucciones[i]),
                Image.asset(instrucciones[i]),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('cerrar'),
              onPressed: () {
                auxAudioInstrucciones = false;
                reproduceInstrucciones.stop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  //only text 
   Future<void> _showMyDialogtext(BuildContext context, int i) async {
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
                Image.asset(instrucciones[i]),
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
