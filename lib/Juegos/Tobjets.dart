import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanador.dart';
import 'package:rompecabezas_sika/ContenidoIdioma/Intrucciones.dart';

import '../Audio.dart';
import '../BaseAppBar.dart';

class BuscaObjeto extends StatefulWidget {
  final List<String> imagenes;
  final int id_escenario;
  final int id;
  final String imgcorrecta;
  final String objeto;
  final Color fondo;
  const BuscaObjeto(
      {this.objeto,  this.imgcorrecta,  this.imagenes, this.id, this.id_escenario, this.fondo})
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
        appBar:getAppBar("Sikanda",4,context),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                    'Encuentra ' + widget.objeto ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
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
                        child: BotonAudio(intruccionesAux[1])
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width,
              //color: widget.fondo,
            ),
            SizedBox(
              height: 20,//padding top
            ),
            acertado
                ? Center(
                child:
                Ganador(
                    id:widget.id,id_game: 2,
                    id_escenario: widget.id_escenario,
                    fondo:widget.fondo
                )

            )
                : Wrap(
              direction: Axis.horizontal,
              spacing: 15.0,
              runSpacing: 15.0,
              children: objetos,
            )
          ],
        )
    );
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