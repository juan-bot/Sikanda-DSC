import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'Audio.dart';
import 'Constantes.dart';
import 'EscenariosScreens/Banio/ListarObjetosBanio.dart';
import 'EscenariosScreens/Cocina/ListarObjetosCocina.dart';
import 'EscenariosScreens/Recamara/ListarObjetosRecamara.dart';
import 'dart:math' as math;

class Photo extends StatelessWidget {
  Photo({ Key key, this.photo, this.color, this.onTap }) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Image.asset(
              photo,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}
class RadialExpansionDemo extends StatelessWidget {
  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(BuildContext context, String imageName, String description, Color fondo,String audio) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color(0xFF9D2929),
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
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9D2929)),
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                        foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF9D2929)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Color(0xFF9D2929))
                            )
                        )
                    ),
                    child: Text('Explorar $description',
                        style: TextStyle(
                          //fontFamily: "Love",
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontSize: 30,
                        )
                    ),
                    onPressed: () {
                      print("$description");
                      if(description=="Cocina"){
                        juegoPalabras=AudioCocinaFrases;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ListarObjetosCocina(fondo)
                          ),
                        );
                      }
                      else if(description=="Baño"){
                        juegoPalabras=AudioBanioFrases;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ListarObjetosBanio(fondo)
                          ),
                        );
                      }
                      else{
                        juegoPalabras=AudioRecamaraFrases;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ListarObjetosRecamara(fondo)
                          ),
                        );
                      }
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
  Widget mundo(BuildContext context,String imageName, String name, Color color, String audio) {
    return Container(
        height: 350,
        child:FittedBox(
        child: Column(children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            //codigo de un mundo
            padding: EdgeInsets.all(kDefaultPaddin),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(const Radius.circular(26)),
            ),
            child: Column(
              children: [
                Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child:Container(
                    height: 200,
                    width: 200,
                    child:FittedBox(
                      fit: BoxFit.fill,
                  child: Photo(
                    photo: imageName,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder<void>(
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                            return AnimatedBuilder(
                                animation: animation,
                                builder: (BuildContext context, Widget child) {
                                  return Opacity(
                                    opacity: opacityCurve.transform(animation.value),
                                    child: _buildPage(context, imageName, name, color, audio),
                                  );
                                }
                            );
                          },
                        ),
                      );
                    },
                  ))),
                ),
                SizedBox(height: 10,),
                Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white, //),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        name,
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
                                      padding:
                                          const EdgeInsets.all(1),
                                      child: BotonAudio(
                                          audio)),
                                )
                              ],
                            ),
                          )
              ],
            ),
          ),
        ]
        ))
    );
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 is normal animation speed.
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.all(10.0),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Column(
              children: [//llamada para los escenarios
                mundo(context, 'assets/images/cocina2.gif', 'Cocina',Colors.orange[800],escenarios[0]),
                mundo(context, 'assets/images/baño2.gif', 'Baño',Color(0xFFFFC400),escenarios[1]),
                mundo(context, 'assets/images/recamara2.gif', 'Recámara',Color(0xFF01A2C6),escenarios[2]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}