import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/Juegos/Palabras.dart';
import 'package:rompecabezas_sika/Juegos/Rompecabezas.dart';
import 'package:rompecabezas_sika/SeleccionIdiomas.dart';
import '../../Audio.dart';
import '../../Constantes.dart';
import '../../InfoObjetosEscenario/Cocina.dart';
import '../../escenarios.dart';

class ItemCardCocina extends StatelessWidget {
  final Cocina cocina;
  final Function press;
  const ItemCardCocina({
    Key key,
    this.cocina,
    this.press,
  }) : super(key: key);

  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
  static Widget _buildPage(BuildContext context, String imageName, String description, Color fondo,String audio,int id,int id_escenario) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text('Volver',
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Love",
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        //leading: IconButton(icon: icon, onPressed: onPressed),
      ),
      body: Container(
        color: fondo,
        child: Center(
          child: Card(
            elevation: 8.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Hero(
                    tag: imageName,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      description,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 3.0,
                    ),
                    BotonAudio(audio),
                  ],
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[900]),
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.orange[800]),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Colors.orange)
                            )
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jugar',
                            style: TextStyle(
                              fontFamily: "Love",
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 30,
                            )
                        ),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ],
                    ),

                    onPressed: () {

                       Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
         
                         Rompecabezas(
                            id_escenario: id_escenario,
                            id: id,
                            imagen: imageName, //imagen del rompecabezas
                            ren: 2, //Renglones rompecabezas
                            col: 2,
                            audio:audio,
                            nombre:description,
                            color:fondo
                        )
                       ));
                    }
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
       }
  @override
  Widget build(BuildContext context) {
    print(cocina.id);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: cocina.color,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Hero(
                createRectTween: _createRectTween,
                tag: "${cocina.id}",
                child: Photo(
                  photo: cocina.image,
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder<void>(
                        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                          return AnimatedBuilder(
                              animation: animation,
                              builder: (BuildContext context, Widget child) {
                                return Opacity(
                                  opacity: opacityCurve.transform(animation.value),
                                  child: _buildPage(context, cocina.image, cocina.title, cocina.color, AudioCocina[cocina.id-1],(cocina.id-1),1),
                                );
                              }
                          );
                        },
                      ),
                    );
                  },
                ),
                /*tag: "${banio.id}",
                child: Image.asset(banio.image),*/
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Row(
              children: [
                Text(
                  cocina.title,
                  style: TextStyle(color: kTextLightColor),
                ),
                BotonAudio(AudioCocina[cocina.id-1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}