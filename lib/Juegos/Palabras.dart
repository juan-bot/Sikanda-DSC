import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanadorNiveles.dart';
import '../Audio.dart';
import '../BaseAppBar.dart';
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
            show(context, "¡Muy bien!", Colors.green[200], "assets/images/feliz.png");

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
      appBar:getAppBar("Sikanda",3,context),
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
                    Container(
                      height: 55,
                      width: 55,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber, //),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: BotonAudio(juegoPalabras[widget.id])
                      ),
                    ),
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