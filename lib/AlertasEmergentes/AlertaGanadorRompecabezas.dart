import 'package:flutter/material.dart';
import 'package:floating_text/floating_text.dart';

class Ganador extends StatefulWidget {
  final String title;
  final String imagen;
  Ganador({Key key, this.title, this.imagen}) : super(key: key);
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
    return Container(
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
                  color: Colors.green,
                  fontSize: 50,
                  shadows: [
                    BoxShadow(
                      color: Colors.yellow,
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
              Container(
                child:Image.asset("assets/images/logrado.gif",scale: 0.5,),
                height: 200,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.green[800]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              side: BorderSide(color: Colors.green[800])))),
                  child: Text('Regresar',
                      style: TextStyle(
                        //fontFamily: "Love",
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontSize: 30,
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ]));
  }}