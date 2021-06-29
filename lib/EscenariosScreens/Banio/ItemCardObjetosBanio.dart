import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/Juegos/Rompecabezas.dart';
import '../../Audio.dart';
import '../../Constantes.dart';
import '../../InfoObjetosEscenario/Banio.dart';
import '../../escenarios.dart';

class ItemCardBanio extends StatelessWidget {
  final Banio banio;
  final Function press;
  const ItemCardBanio({
    Key key,
    this.banio,
    this.press,
  }) : super(key: key);
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName,
      String description, Color fondo, String audio, int id, int id_escenario) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9D2929),
        title: Text(
          'Volver',
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
        color: fondo, //color of display image
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
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF9D2929)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF9D2929)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side:
                                        BorderSide(color: Color(0xFF9D2929))))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jugar',
                            style: TextStyle(
                              //fontFamily: "Love",
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 30,
                            )),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ],
                    ),
                    onPressed: () {
                      final route = MaterialPageRoute(builder: (context) {
                        return Rompecabezas(
                            id_escenario: id_escenario,
                            id: id,
                            imagen: imageName, //imagen del rompecabezas
                            ren: 2, //Renglones rompecabezas
                            col: 2,
                            audio: audio,
                            nombre: description,
                            color: fondo);
                      });
                      Navigator.push(context, route);
                    }),
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: banio.color,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: FittedBox(
                    //
                    fit: BoxFit.fill,
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 100,
                            child: Hero(
                                createRectTween: _createRectTween,
                                tag: "${banio.id}",
                                child: Material(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.0),
                                    child: InkWell(
                                      child: Container(
                                        //COLOR DE FONDO DE LAS TARJETAS
                                        height: 100,
                                        width: 195,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(banio.image),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder<void>(
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) {
                                              return AnimatedBuilder(
                                                  animation: animation,
                                                  builder:
                                                      (BuildContext context,
                                                          Widget child) {
                                                    return Opacity(
                                                      opacity: opacityCurve
                                                          .transform(
                                                              animation.value),
                                                      child: _buildPage(
                                                          context,
                                                          banio.image,
                                                          banio.title,
                                                          banio.color,
                                                          AudioBanio[
                                                              banio.id - 1],
                                                          (banio.id - 1),
                                                          2),
                                                    );
                                                  });
                                            },
                                          ),
                                        );
                                      },
                                    ))),
                            /*tag: "${banio.id}",
                child: Image.asset(banio.image),*/
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 140,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white, //),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        banio.title,
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontSize: 30),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white, //),
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child:
                                          BotonAudio(AudioBanio[banio.id - 1])),
                                )
                              ],
                            ),
                          )
                        ]))),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
