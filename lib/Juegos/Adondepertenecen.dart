import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanador.dart';
import 'package:rompecabezas_sika/ContenidoIdioma/FrasesJuegos.dart';
import 'package:rompecabezas_sika/ContenidoIdioma/Intrucciones.dart';

import '../Audio.dart';
import '../BaseAppBar.dart';

class EstaEn extends StatefulWidget {
  final int id_escenario;
  final int id;
  final List<String> imagenes;
  final int validos;
  final String lugar;
  final String frase;
  final String imglugar;
  final Color fondo;
  const EstaEn(
      {Key key,
      this.id_escenario,
      this.id,
      this.imglugar,
      this.validos,
      this.lugar,
      this.frase,
      this.imagenes,
        this.fondo})
      : super(key: key);
  @override
  _EstaEnState createState() => _EstaEnState();
}
class _EstaEnState extends State<EstaEn>{
  int contv = 0;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: getAppBar("Sikanda",5,context),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color:widget.fondo,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45.0),
                  bottomLeft: Radius.circular(45.0),
                ),
                //color: Colors.amber,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "¿Que hay en " + widget.frase + "?",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white, //),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: BotonAudio(animo[4])
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width,
              //color: widget.fondo,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDragTarget(MediaQuery.of(context).size.width / 5, widget.lugar)
                    ],
                  ),
                  contv >= widget.validos
                    ? Container(
                      key: UniqueKey(),
                        //height: 270,
                        height: MediaQuery.of(context).size.height * 0.37,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Ganador(
                            id: widget.id,
                            id_game: 3,
                            id_escenario: widget.id_escenario
                          )
                        )
                    )
                    :Container(
                      padding: const EdgeInsets.only(top: 10),
                       child: Wrap(
                        key: UniqueKey(),
                        alignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: List.generate(
                            widget.imagenes.length,
                                (index) => buildDragObjet(widget.imagenes[index], index,
                                MediaQuery.of(context).size.width / 4)
                        ),
                      ),
                    ),
                  //objetos
                  ]
                ),
              ),
            ]
          )
    );
  }

  Draggable<String> buildDragObjet(img, pos, ancho) {
    List<String> a = img.split("--");
    return Draggable(
        child: Container(
            child: FittedBox(
              child: Column(
                children: [
                  Container(
                    width: ancho,
                    height: ancho,
                    child: FittedBox ( child: Image.asset(a[0])),
                  ),
                  Container(
                    width: ancho,
                    child: Material(
                      //color: Color(0xFFD15A05),
                      child: Text(
                        a[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            )),
        //

        data: pos.toString(),
        feedback: Container(
            child: FittedBox(
              child: Column(
                children: [
                  Container(
                    width: ancho,
                    height: ancho,
                    child: FittedBox(
                        child: Image.asset(
                      a[0],
                    )),
                  ),
                  Container(
                    width: ancho,
                    child: Material(
                      color: Color(0xFFD15A05),
                      child: Text(
                        a[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(border: Border.all(width: 1))));
  }

  DragTarget<String> buildDragTarget(ancho, id) {
    AudioCache cache;
    cache = AudioCache(fixedPlayer: FrasesAnimo);
    return DragTarget(
      onAccept: (data) {
        if (widget.imagenes[int.parse(data)].split("--")[2] == id)
          setState(() {
            widget.imagenes.removeAt(int.parse(data));
            contv++;
            print("pprueeeeebaaaa2S");
      print(widget.imagenes);
            cache.play(animo[3]);
            show(context, "¡Muy bien!", Colors.green[200],
                "assets/images/feliz.png");
          });
        else{
          cache.play(animo[2]);
          show(context, "Prueba de nuevo", Colors.red[200],
              "assets/images/confundido.png");
        }

      },
      builder: (BuildContext context, List<String> candidateData,
          List<dynamic> rejectedData) {
        return candidateData.isEmpty
            ? Container(key: UniqueKey(),
                child: Column(
                  children: [
                    Container(
                        //color: Color(0xFFD15A05),
                        width: ancho * 2,
                        height: ancho * 2,
                        child: FittedBox(
                          child: Image.asset(
                            widget.imglugar,
                          ),
                        )),
                    Material(
                      //color: Color(0xFFD15A05),
                      child: Container(
                        width: ancho * 2,
                        child: Text(id,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(width: 1)))
            : Opacity(
                opacity: 0.7,
                child: Container(key: UniqueKey(),
                    //margin: const EdgeInsets.only(bottom: 10.0),
                    // ignore: deprecated_member_use
                    //color: Colors.yellow,
                    child: Column(
                      children: [
                        Container(
                            width: ancho * 2,
                            height: ancho * 2,
                            child: FittedBox(
                              child: Image.asset(
                                widget.imglugar,
                              ),
                            )),
                        Material(
                          //color: Color(0xFFD15A05),
                          child: Container(
                            width: ancho * 2,
                            child: Text(
                              id,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(border: Border.all(width: 1))),
              );
      },
    );
    
  }

  void show(BuildContext context, String msj, Color col, String img) {
    AchievementView(
      context,
      duration: const Duration(microseconds:1),
      icon: Image.asset(img),
      color: col,
      title: msj,
      subTitle: " ",
      textStyleTitle: TextStyle(
        fontSize: 25,
      ),
      isCircle: true,
      listener: (status) {
        print(status);
      },
    )..show();
  }

 
}
