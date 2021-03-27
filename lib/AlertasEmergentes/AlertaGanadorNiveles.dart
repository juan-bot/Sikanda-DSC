import 'package:flutter/material.dart';
import 'package:floating_text/floating_text.dart';
import 'package:rompecabezas_sika/AlertasEmergentes/AlertaMenuEscenarios.dart';

class GanadorNivel extends StatefulWidget {
  
  
  GanadorNivel(
      {Key key,
      })
      : super(key: key);
  @override
  Instruccion createState() => Instruccion();
}

class Instruccion extends State<GanadorNivel> {
  String imagen;
  Instruccion({this.imagen});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
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
                        text: 'Felicidades!!!',
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
                      Text("Has completado todos los niveles!", style: TextStyle(fontSize: 30),),
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
                                child: Text('Regresar al inicio',
                                    style: TextStyle(
                                      //fontFamily: "Love",
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                      fontSize: 25,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                 context,
                                MaterialPageRoute(
                              builder: (context) => Escenario()


                            ));}),
                            SizedBox(
                              width: 10,
                            ),
                            
                          ]))
                    ]))));
  }
}