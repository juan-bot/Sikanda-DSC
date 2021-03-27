import 'package:audioplayers/audio_cache.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanadorNiveles.dart';
import 'package:rompecabezas_sika/ContenidoIdioma/Intrucciones.dart';
import '../Audio.dart';
import '../Constantes.dart';

class Relacionable extends StatefulWidget {
  final int id;
  final int id_escenario;
  final String imagen;
  final String mostrar;
  final String audio;
  final List<String> opciones;
  final String correcta;
  final List<String> imagenes;

  Relacionable(
      {this.imagenes,
        this.id_escenario,
        this.id,
        this.mostrar,
        this.opciones,
        this.correcta,
        this.imagen,
        this.audio});
  @override
  _RelacionableState createState() => _RelacionableState();
}

class _RelacionableState extends State<Relacionable> {
  bool ready = false;
  double anchot = 0;
  bool correct = false;
  bool dragg = false;
  String actual = "";
  List<Widget> contenido = [];
  List<Widget> options = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog());
  }

  void armadatos() {
    widget.mostrar.split(" ").forEach((element) {
      actual = "_" * widget.correcta.length;
      if (element != '--')
        contenido.add(palabra(element));
      else
        contenido.add((buildDragTarget(widget.correcta)));
      //print(element);
    });
    int i = 0;
    int max = 0;

    widget.opciones.forEach((element) {
      max = max < element.length ? element.length : max;
      options
          .add(buildDragObjet(opciones(element, widget.imagenes[i]), element));
      //print(element);
      i++;
    });
    print(max);
    anchot = 12.0 * max;
    setState(() {
      ready = true;
    });
  }

  Container opciones(String opcion, String img) {
    return Container(
      //child: //Padding(
      //padding: const EdgeInsets.all(2.0),
      // ignore: deprecated_member_use
        child: RaisedButton.icon(
          icon: Image.asset(
            img,
            height: 30,
          ),
          color: new Color(0xffeadffd),
          label: Text(
            opcion,
            style: TextStyle(
              color: new Color(0xff6200ee),
            ),
          ),
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            //)
          ),
        ));
  }

  //palabras
  Container palabra(String nombre) {
    return Container(
      child: Text(
        nombre,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: new Color(0xff6200ee),
        ),
      ),
    );
  }

  Draggable<String> buildDragObjet(object, id) {
    return Draggable(
      child: Container(
        height: 30,
        child: object,
      ),

      // decoration: BoxDecoration(border: Border.all(width: 1))

      data: id.toString(),
      feedback: Container(
        height: 30,
        child: object,
      ),
    );
  }

  DragTarget<String> buildDragTarget(id) {
    return DragTarget(
      onAccept: (data) {
        setState(() {
          dragg = false;
        });
        actual = data;
        print(id);
        print(data);
        if (id == data)
          setState(() {
            correct = true;
          });
        else
          setState(() {
            show(context, "Prueba otra vez", Colors.red[100],
                "assets/images/confundido.png");
          });
      },
      builder: (BuildContext context, List<String> candidateData,
          List<dynamic> rejectedData) {
        return candidateData.isEmpty
            ? Container(
          width: anchot,
          child: Center(
            child: Text(
              actual,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          height: 30,
        )
            : Opacity(
          opacity: 0.7,
          child: Container(
            width: anchot,
            margin: const EdgeInsets.only(bottom: 10.0),
            //ignore: deprecated_member_use
            child: RaisedButton(
                padding:
                const EdgeInsets.only(left: 5, right: 4, bottom: 15),
                color: Colors.green,
                child: Text(
                  "_" * id.length,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: new Color(0xff6200ee),
                  ),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  //)
                )),
            height: 30,
          ),
        );
      },
    );
  }

  //Divider
  Container separador() {
    return Container(
      height: 1.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!ready) armadatos();
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
          ? Container()
          : correct
          ? Center(child: GanadorNivel())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Offer heading
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FittedBox(
                        child: Image.asset(widget.imagen),
                        fit: BoxFit.fill,
                      ),
                    )),
              ]),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BotonAudio(juegoPalabras[widget.id])
                  ]
              )
          ),   //    audio de la accion
          SizedBox(
            height: 30,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10.0,
            runSpacing: 5.0,
            children: contenido,
          ),
          Container(
            height: 30,
          ),
          separador(),
          Container(
            height: 30,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10.0,
            runSpacing: 15.0,
            children: options,
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    AudioCache cache;
    cache = AudioCache(fixedPlayer: reproduceInstrucciones);
    cache.loop(intruccionesAux[3]);
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
                Text(instrucciones[3]),
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