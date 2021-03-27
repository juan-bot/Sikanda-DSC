import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../Constantes.dart';
import '../ContenidoIdioma/Intrucciones.dart';

Future<void> MostrarInformacion(BuildContext context) async {
  AudioCache cache;
  cache = AudioCache(fixedPlayer: reproduceInstrucciones);
  cache.loop(intruccionesAux[1]);
  auxAudioInstrucciones=true;
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Instrucciones'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(instrucciones[1]),
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