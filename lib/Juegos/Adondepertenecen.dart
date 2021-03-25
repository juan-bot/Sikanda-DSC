import 'package:flutter/material.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanadorRompecabezas.dart';

class EstaEn extends StatefulWidget {
  final List<String> imagenes;
  final int validos;
  final String lugar;
  final String frase;
  final String imglugar;

  const EstaEn(
      {Key key,
      this.imglugar,
      this.validos,
      this.lugar,
      this.frase,
      this.imagenes})
      : super(key: key);

  @override
  _EstaEnState createState() => _EstaEnState();
}

class _EstaEnState extends State<EstaEn> {
  List<Widget> objetos = [];
  int contv = 0;
  int minpos = 10;
  List<int> posiciones = [];
  bool ready = false;

  @override
  Widget build(BuildContext context) {
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
                showMyDialog(context);
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "¿Que hay en " + widget.frase + "?",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDragTarget(
                    MediaQuery.of(context).size.width / 5, widget.lugar)
              ],
            ),
            contv >= widget.validos
                ? Ganador()
                : Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: List.generate(
                        widget.imagenes.length,
                        (index) => buildDragObjet(widget.imagenes[index], index,
                            MediaQuery.of(context).size.width / 4)),
                  ),
            //objetos
          ],
        ));
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
                    child: FittedBox(child: Image.asset(a[0])),
                  ),
                  Container(
                    width: ancho,
                    child: Material(
                      color: Colors.yellow,
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
                      color: Colors.yellow,
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
    return DragTarget(
      onAccept: (data) {
        if (widget.imagenes[int.parse(data)].split("--")[2] == id)
          setState(() {
            widget.imagenes.removeAt(int.parse(data));
            contv++;
            show(context, "Muy bien!!", Colors.green[200], "images/feliz.png");
          });
        else
          show(context, "Prueba de nuevo", Colors.red[200],
              "images/confundido.png");
      },
      builder: (BuildContext context, List<String> candidateData,
          List<dynamic> rejectedData) {
        return candidateData.isEmpty
            ? Container(
                child: Column(
                  children: [
                    Container(
                        color: Colors.yellow,
                        width: ancho * 2,
                        height: ancho * 2,
                        child: FittedBox(
                          child: Image.asset(
                            widget.imglugar,
                          ),
                        )),
                    Material(
                      color: Colors.yellow,
                      child: Container(
                        width: ancho * 2,
                        child: Text(id,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(width: 1)))
            : Opacity(
                opacity: 0.7,
                child: Container(
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
                          color: Colors.yellow,
                          child: Container(
                            width: ancho * 2,
                            child: Text(
                              id,
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
                    decoration: BoxDecoration(border: Border.all(width: 1))),
              );
      },
    );
  }
}
