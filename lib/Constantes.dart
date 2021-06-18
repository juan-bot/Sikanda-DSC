import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
  const kTextColor = Color(0xFF535353);
  const kTextLightColor = Color(0xFF000000);
  const kDefaultPaddin = 20.0;
  bool auxAudioInstrucciones=false,auxAudio=false;
  AudioPlayer reproduceFondo = AudioPlayer();
  AudioPlayer reproduceInstrucciones = AudioPlayer();
  AudioPlayer reproduceFrases = AudioPlayer();

  List<String> juegoPalabras;

  List<String> escenarios;

  List<String> AudioBanio;
  List<String> TextBanio;

  List<String> AudioRecamara;
  List<String> TextRecamara;

  List<String> AudioCocina;
  List<String> TextCocina;

  List<String> AudioBanioFrases;
  List<String> TextBanioFrases;

  List<String> AudioRecamaraFrases;
  List<String> TextRecamaraFrases;

  List<String> AudioCocinaFrases;
  List<String> TextCocinaFrases;