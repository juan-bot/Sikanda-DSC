import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanador.dart';

import '../BaseAppBar.dart';

class BuscaObjeto extends StatefulWidget {
  final List<String> imagenes;
  final int id_escenario;
  final int id;
  final String imgcorrecta;
  final String objeto;
  const BuscaObjeto(
      {this.objeto,  this.imgcorrecta,  this.imagenes, this.id, this.id_escenario})
      : super();

  @override
  _BuscaObjetoState createState() => _BuscaObjetoState();
}

class _BuscaObjetoState extends State<BuscaObjeto> {
  List<Widget> objetos = [];
  bool acertado = false;
  bool listo = false;
  void carga(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width / 4;
    widget.imagenes.forEach((element) {
      objetos.add(
        // Aqui es donde tienes que ver como animarlo
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: ancho,
                    height: ancho,
                    child: FittedBox(child: Image.asset(element.split("--")[0])),
                  ),
                  Container(
                    width: ancho,
                    child: Text(
                      element.split("--")[1],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                
              ),
            ),
            onTap: () {
              setState(() {
                acertado = element.split("--")[1] == widget.imgcorrecta;
                if(!acertado)
                  show(context, "Inténtalo de nuevo", Colors.red[200], "assets/images/confundido.png");
                else
                  show(context, "¡Muy bien!", Colors.green[200], "assets/images/feliz.png");

              });
            },
          )
        // aqui termina todo
      );
    });
    setState(() {
      listo = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listo ? listo = true : carga(context);
    return Scaffold(
        appBar:getAppBar("sikanda...",4,context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(child:Text(
                  'Encuentra ' + widget.objeto ,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),)
            ]),
            acertado
                ? Center(
                child: Ganador(id:widget.id,id_game: 2, id_escenario: widget.id_escenario)

            )
                : Wrap(
              direction: Axis.horizontal,
              spacing: 15.0,
              runSpacing: 15.0,
              children: objetos,
            )
          ],
        ));
  }
  
  void show(BuildContext context, String msj, Color col, String img) {
    AchievementView(
      context,
      icon: Image.asset(img),
      color: col,
      title: msj,
      subTitle: " ",
      textStyleTitle: TextStyle(fontSize: 25,),
      isCircle: true,
      listener: (status) {
        print(status);
      },
    )..show();
  }

}