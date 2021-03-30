import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imglib;
import 'package:rompecabezas_sika/ContenidoIdioma/Intrucciones.dart';
import 'package:achievement_view/achievement_view.dart';
import '../AlertasEmergentes/AlertaGanador.dart';
import '../Audio.dart';
import '../Constantes.dart';

class Rompecabezas extends StatefulWidget {
  //------Estos indentificadores indican que tarjeta esta en cada
  //------posicion sirven para saber si estan correctos o no.
  final int id_escenario;
  final int id;
  final String imgn; //imagen ganador
  final String imagen; //imagen a armar
  final Color color;
  final String nombre, audio;
  final int ren, col; //0
  Rompecabezas(
      {this.imagen,
      this.id_escenario,
      this.ren,
      this.col,
      this.audio,
      this.nombre,
      this.color,
      this.imgn,
      this.id});

  @override
  _RompecabezasState createState() => _RompecabezasState(
      img: imagen, audio: audio, nombre: nombre, fondo: color);
}

class _RompecabezasState extends State<Rompecabezas> {
//Datos de la imagen
  final String img;
  final String audio;
  final String nombre;
  final Color fondo;
  _RompecabezasState({
    this.img,
    this.audio,
    this.nombre,
    this.fondo,
  });

  List<Image> output = List<Image>.empty(growable: true);
  List<int> bytes = [];
  bool init = false;
  //--------Banderas que indican si estan en su posicion
  //-------- correcta
  bool error = false;
  bool armado = false;
  bool ready = false;
  bool spliteready = false;
  // indica si el objeto se esta moviendo
  bool dragg = false;
  // son lo nombres de las imagenes y corresponder a cada posicion en el tablero
  String name1 = "";
  String name2 = "";
  String name3 = "";
  String name4 = "";
  List<Image> names = [];
  double ancho = 0.0;
  double alto = 0.0;
  //final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  List<Widget> partes = [];
  List<Widget> colum = [];
  List<Widget> colum2 = [];
  List<Widget> renglones = [];
  List<Widget> renglones2 = [];
  List<int> posiciones = [];
  List<int> orden = [];
  bool buscando = true;

  leer(BuildContext context) async {
    var imageData = await rootBundle.load(widget.imagen);
    bytes = Uint8List.view(imageData.buffer);
    int tamw = (MediaQuery.of(context).size.width).round() - widget.col;
    int tamh = (MediaQuery.of(context).size.height).round() -
        widget.ren -
        200 -
        (MediaQuery.of(context).size.height * 0.15).round();
    if (tamw > tamh) tamw = tamh;

    splitImage(imglib.copyResize(imglib.decodeImage(bytes),
        width: tamw, height: tamw));
    setState(() {
      spliteready = true;
    });
  }

  void splitImage(dat) async {
    imglib.Image image = dat;
    int x = 0, y = 0;
    int width = (image.width / widget.col).round();
    int height = (image.height / widget.ren).round();
    ancho = width + 0.0;
    alto = height + 0.0;
    // split image to parts
    List<imglib.Image> parts = new List<imglib.Image>.empty(growable: true);
    for (int i = 0; i < widget.ren; i++) {
      for (int j = 0; j < widget.col; j++) {
        parts.add(imglib.copyCrop(image, x, y, width, height));
        x += width;
      }
      x = 0;
      y += height;
    }
    // convert image from image package to Image Widget to display
    for (var img in parts) {
      output.add(Image.memory(Uint8List.fromList(imglib.encodePng(img))));
    }
  }

  void cargadatos(BuildContext context) {
    for (var i = 0; i < output.length; i++) {
      posiciones.add(i);
      orden.add(i);
    }
    bool band = false;
    if (widget.ren * widget.col != 2)
      do {
        band = true;
        posiciones.shuffle();
        int ant = 0;

        posiciones.forEach((element) {
          if (ant > element) {
            band = false;
          } //////cambie
          ant = element;
        });
      } while (band);
    else {
      posiciones[0] = 1;
      posiciones[1] = 0;
    }
    for (var i = 0; i < output.length; i++) {
      names.add(output[(posiciones[i])]);
    }
    for (var i = 0; i < widget.ren; i++) {
      renglones = [];
      renglones2 = [];
      for (var j = 0; j < widget.col; j++) {
        renglones.add(
            buildDragTarget(names[i * widget.col + j], i * widget.col + j));
        renglones2
            .add(buildDragObjet(names[i * widget.col + j], i * widget.col + j));
      }
      colum.add(
        Row(mainAxisAlignment: MainAxisAlignment.center, children: renglones),
      );
      colum2.add(
        Row(mainAxisAlignment: MainAxisAlignment.center, children: renglones2),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog());
  }

  @override
  Widget build(BuildContext context) {
    if (!init) {
      setState(() {
        init = true;
      });
      leer(context);
    }
    if (spliteready && !ready) {
      setState(() {
        ready = true;
      });
      cargadatos(context);
    }
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
      body: !ready
          ? //if true
//----------- Animacion de cargando
          Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.indigoAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Cargando...",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          //-------- Termina animacion de cargando ---
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orange[100],
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Arma el rompecabezas",
                            style: TextStyle(fontSize: 30, fontFamily: "Love"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        margin: const EdgeInsets.all(5),
                                        child: Image.asset(img)),
                                    Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                          Center(
                                              child: Text(nombre,
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ))),
                                          BotonAudio(audio),
                                        ]))
                                  ]),
                              color:
                                  fondo, //Colors.orange[100],                  //////////////////////////color//////////////////////////
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width)
                        ])),
                SizedBox(
                  height: 10,
                ),
                armado
                    ? Ganador(
                        id: widget.id,
                        id_game: 1,
                        id_escenario: widget.id_escenario)

                    //______________________
                    //aqui se pone el mensaje de felicitacion
                    : Expanded(
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 0.59,

                          ///revisar como se ven en otros telefonos
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: (dragg ? colum : colum2)),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
    );
  }

  Draggable<String> buildDragObjet(img, id) {
    return Draggable(
      child: Container(
          child: img,
          width: ancho,
          height: alto,
          decoration: BoxDecoration(border: Border.all(width: 1))),
      data: id.toString(),
      feedback: Opacity(
          opacity: 1,
          child: Container(
              child: img,
              width: ancho,
              height: alto,
              decoration: BoxDecoration(border: Border.all(width: 1)))),
      onDragStarted: () {
        setState(() {
          dragg = true;
        });
      },
      onDraggableCanceled: (velocity, offset) {
        setState(() {
          dragg = false;
        });
      },
    );
  }

  DragTarget<String> buildDragTarget(img, id) {
    return DragTarget(
      onAccept: (data) {
        setState(() {
          dragg = false;
          int t1 = posiciones[int.parse(data)];
          posiciones[int.parse(data)] = posiciones[id];
          posiciones[id] = t1;
          error = false;
          if (posiciones[id] != id) {
            error = true;
            show(context, "Prueba otra vez", Colors.red[200],
                "assets/images/confundido.png");
          } else
            show(context, "¡Muy bien!", Colors.green[200],
                "assets/images/feliz.png");

          Image temp = names[int.parse(data)];
          names[int.parse(data)] = names[id];
          names[id] = temp;
          colum = [];
          colum2 = [];
          for (var i = 0; i < widget.ren; i++) {
            renglones = [];
            renglones2 = [];
            for (var j = 0; j < widget.col; j++) {
              renglones.add(buildDragTarget(
                  names[i * widget.col + j], i * widget.col + j));
              renglones2.add(buildDragObjet(
                  names[i * widget.col + j], i * widget.col + j));
            }
            colum.add(
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: renglones),
            );
            colum2.add(
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: renglones2),
            );
          }
          var tam = posiciones.length;
          armado = true;
          for (var i = 0; (i < tam) & armado; i++) {
            if (posiciones[i] != orden[i]) {
              armado = false;
            }
          }
        });
      },
      builder: (context, candidateData, List<dynamic> rejectedData) {
        return candidateData.isEmpty
            ? Container(
                child: img,
                width: ancho,
                height: alto,
                decoration: BoxDecoration(border: Border.all(width: 1)))
            : Opacity(
                opacity: 0.7,
                child: Container(
                    child: img,
                    width: ancho,
                    height: alto,
                    decoration: BoxDecoration(border: Border.all(width: 1))),
              );
      },
    );
  }

  Future<void> _showMyDialog() async {
    AudioCache cache;
    cache = AudioCache(fixedPlayer: reproduceInstrucciones);
    cache.loop(intruccionesAux[2]);
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
                Text(instrucciones[2]),
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

  void show(BuildContext context, String msj, Color col, String img) {
    AchievementView(
      context,
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
