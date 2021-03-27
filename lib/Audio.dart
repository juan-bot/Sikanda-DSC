import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'Constantes.dart';
class BotonAudio extends StatefulWidget {
  var aux;
  BotonAudio(this.aux);
  @override
  AudioBtn createState() => AudioBtn(aux);
}
class AudioBtn extends State<BotonAudio> {
  bool playing = false;
  IconData playBtn = Icons.volume_up;
  //AudioPlayer _player;
  AudioCache cache;
  var aux;
  var sonido;
  AudioBtn(this.sonido);
  @override
  void initState() {
    super.initState();
   // _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: reproduceFrases);
    reproduceFrases.setVolume(1.0);
  }
  @override
  Widget build(BuildContext context) {
    reproduceFrases.onPlayerCompletion.listen((event) {
      setState(() {
        playBtn = Icons.volume_up;
        playing = false;
        auxAudio=false;
      });
    });
    return IconButton(
      iconSize: 40.0,
      color: Colors.blue[800],
      onPressed: () {
        if (!playing) {
          cache.play(sonido);
          setState(() {
            playBtn = Icons.volume_off;
            playing = true;
            auxAudio=true;
          });
        } else {
          reproduceFrases.stop();
          setState(() {
            playBtn = Icons.volume_up;
            playing = false;
            auxAudio=false;
          });
        }
      },
      icon: Icon(
        playBtn,
      ),
    );
  }
}
