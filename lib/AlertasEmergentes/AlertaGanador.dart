import 'package:flutter/material.dart';
import 'package:floating_text/floating_text.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaGanadorNiveles.dart';
import 'package:rompecabezas_sika/InfoObjetosEscenario/Banio.dart';
import 'package:rompecabezas_sika/InfoObjetosEscenario/Cocina.dart';
import 'package:rompecabezas_sika/InfoObjetosEscenario/Recamara.dart';
import 'package:rompecabezas_sika/Juegos/Adondepertenecen.dart';
import 'package:rompecabezas_sika/Juegos/Palabras.dart';
import 'package:rompecabezas_sika/Juegos/Tobjets.dart';

import 'AlertaMenuEscenarios.dart';

class Ganador extends StatefulWidget {
  final int id_escenario;
  final int id_game;
  final int id;
  final Banio banio = null;
  final Cocina cocina = null;
  final Recamara recamara = null;
  final String title;
  final String imagen;
  final Color fondo;
  Ganador(
      {Key key,
        this.title,
        this.imagen,
        this.id,
        this.id_game,
        this.id_escenario,
        this.fondo
      })
      : super(key: key);
  @override
  Instruccion createState() => Instruccion(imagen: imagen);
}

class Instruccion extends State<Ganador> {
  String imagen;
  Instruccion({this.imagen});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(objetos[widget.id].imagenes);
    print(objetos[widget.id].id);
    return Container(
        height: MediaQuery.of(context).size.height * .6,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Container(
                padding: EdgeInsets.all(20),
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(0.0, 20.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0), //
                    ),
                    border: Border.all(
                        color: Colors.white, // set border color
                        width: 0.0),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingText(
                        text: '¡Felicidades!',
                        repeat: false,
                        textStyle: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                        floatingTextStyle: TextStyle(
                          color: Colors.orange[900],
                          fontSize: 50,
                          shadows: [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 10,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Image.asset(
                          "assets/images/gana.gif",
                          scale: 0.5,
                        ),
                        height: 200,
                      ),
                      SizedBox(height: 10),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.yellow[700]),
                                        padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(10)),
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.yellow[700]),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(40.0),
                                                side: BorderSide(
                                                    color: Colors.yellow[700])))),
                                    child: Text('Regresar',
                                        style: TextStyle(
                                          //fontFamily: "Love",
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 25,
                                        )),
                                    onPressed: () {
                                     // Navigator.of(context).pushReplacementNamed('/escenario');


                                      Navigator.of(context).pushNamedAndRemoveUntil('/escenario', (Route<dynamic> route) => false);

                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orange[900]),
                                        padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(10)),
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orange[900]),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(40.0),
                                                side: BorderSide(
                                                    color: Colors.orange[900])))),
                                    child: Text('Siguiente',
                                        style: TextStyle(
                                          //fontFamily: "Love",
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 25,
                                        )),
                                    onPressed: () {
                                      _detectaEscenario(context);
                                    })
                              ]))
                    ]))));
  }

  _nextLevelCocina(BuildContext context) {
    switch (widget.id_game) {
      case 1:
        {
          //siguiente nivel
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BuscaObjeto(
                  //juego Tobjetos
                  id: widget.id,
                  objeto: objetos[widget.id].objeto,
                  imagenes: objetos[widget.id].imagenes2,
                  imgcorrecta: objetos[widget.id].imgcorrecta,
                  id_escenario: widget.id_escenario,
                    fondo:widget.fondo
                )),
          );
        }
        break;
      case 2:
        { 
          var imagenes = objetos[widget.id].imagenes3.map((v) => v).toList();

          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => EstaEn(
                  //Juego Adondepertenece
                  id: widget.id,
                  frase: objetos[widget.id].frase,
                  lugar: objetos[widget.id].lugar,
                  validos: objetos[widget.id].validos,
                  imagenes: imagenes,
                  imglugar: objetos[widget.id].imglugar,
                  id_escenario: widget.id_escenario,
                    fondo:widget.fondo
                )),
          );
        }
        break;
      case 3:
        {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Relacionable(
                  //juego palabras
                  id: widget.id,
                  mostrar: objetos[widget.id].mostrar,
                  imagen: objetos[widget.id].imagen,
                  opciones: objetos[widget.id].opciones,
                  imagenes: objetos[widget.id].imagenes,
                  correcta: objetos[widget.id].correcta,
                  id_escenario: widget.id_escenario,
                )),
          );
        }
        break;
      default:
        { 
          return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GanadorNivel()

            ),
          );
        }
    }
  }

  _detectaEscenario(BuildContext context) {//Revisa en que escenarios se esta trabajando
    switch (widget.id_escenario) {
      case 1:
        _nextLevelCocina(context);

        break;
      case 2:
        _nextLevelBanio(context);
        break;
      default:
        {
          _nextLevelRecamara(context);
        }
    }
  }

  _nextLevelBanio(BuildContext context) {
    switch (widget.id_game) {
      case 1:
        {
          //siguiente nivel
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BuscaObjeto(
                  //juego Tobjetos
                  id: widget.id,
                  objeto: objetosBanio[widget.id].objeto,
                  imagenes: objetosBanio[widget.id].imagenes2,
                  imgcorrecta: objetosBanio[widget.id].imgcorrecta,
                  id_escenario: widget.id_escenario,
                    fondo:widget.fondo
                )),
          );
        }
        break;
      case 2:
        {
          var imagenes = objetosBanio[widget.id].imagenes3.map((v) => v).toList();

          return 
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>new  EstaEn(
                  //Juego Adondepertenece
                  id: widget.id,
                  frase: objetosBanio[widget.id].frase,
                  lugar: objetosBanio[widget.id].lugar,
                  validos: objetosBanio[widget.id].validos,
                  imagenes: imagenes,
                  imglugar: objetosBanio[widget.id].imglugar,
                  id_escenario: widget.id_escenario,
                    fondo:widget.fondo
                )),
          );
        }
        break;
      case 3:
        {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Relacionable(
                  //juego palabras
                  id: widget.id,
                  mostrar: objetosBanio[widget.id].mostrar,
                  imagen: objetosBanio[widget.id].imagen,
                  opciones: objetosBanio[widget.id].opciones,
                  imagenes: objetosBanio[widget.id].imagenes,
                  correcta: objetosBanio[widget.id].correcta,
                  id_escenario: widget.id_escenario,
                )),
          );
        }
        break;
      default:
        {
          return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GanadorNivel()

            ),
          );
        }
    }
  }
 
  _nextLevelRecamara(BuildContext context) {
    switch (widget.id_game) {
      case 1:
        {
          //siguiente nivel
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BuscaObjeto(
                  //juego Tobjetos
                  id: widget.id,
                  objeto: objetosRecam[widget.id].objeto,
                  imagenes: objetosRecam[widget.id].imagenes2,
                  imgcorrecta: objetosRecam[widget.id].imgcorrecta,
                  id_escenario: widget.id_escenario,
                  fondo:widget.fondo
                )),
          );
        }
        break;
      case 2:
        { var imagenes = objetosRecam[widget.id].imagenes3.map((v) => v).toList();

          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => EstaEn(
                  //Juego Adondepertenece
                  id: widget.id,
                  frase: objetosRecam[widget.id].frase,
                  lugar: objetosRecam[widget.id].lugar,
                  validos: objetosRecam[widget.id].validos,
                  imagenes: imagenes,
                  imglugar: objetosRecam[widget.id].imglugar,
                  id_escenario: widget.id_escenario,
                    fondo:widget.fondo
                )),
          );
        }
        break;
      case 3:
        {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Relacionable(
                  //juego palabras
                  id: widget.id,
                  mostrar: objetosRecam[widget.id].mostrar,
                  imagen: objetosRecam[widget.id].imagen,
                  opciones: objetosRecam[widget.id].opciones,
                  imagenes: objetosRecam[widget.id].imagenes,
                  correcta: objetosRecam[widget.id].correcta,
                  id_escenario: widget.id_escenario,
                )),
          );
        }
        break;
      default:
        {
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GanadorNivel()),
          );
        }
    }
  }
}