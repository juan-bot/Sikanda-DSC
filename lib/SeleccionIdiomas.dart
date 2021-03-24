import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:floating_text/floating_text.dart';
import 'package:flutter/material.dart';
import 'AlertasEmergentes/AlertaMenuEscenarios.dart';
import 'Constantes.dart';
import 'ContenidoIdioma/Banio.dart';
import 'ContenidoIdioma/Cocina.dart';
import 'ContenidoIdioma/Intrucciones.dart';
import 'ContenidoIdioma/Recamara.dart';

class Idiomas extends StatefulWidget{
  Principal createState()=> Principal();
}
//pagina de seleccion de idioma StatelessWidget
class Principal extends State<Idiomas> with WidgetsBindingObserver{
  TextEditingController controller;
  static AudioCache back= AudioCache(fixedPlayer: reproduceFondo);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller=TextEditingController();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.inactive || state == AppLifecycleState.detached) return;
    if(state == AppLifecycleState.paused){
      print("te salisteeeeee");
      reproduceFondo.pause();
      reproduceInstrucciones.pause();
      reproduceFrases.pause();
    }
    if (state == AppLifecycleState.resumed) {
      reproduceFondo.resume();
      if(auxAudioInstrucciones)
        reproduceInstrucciones.resume();
      if(auxAudio)
        reproduceFrases.resume();
    }
  }
  @override
  Widget build(BuildContext context) {
    reproduceFondo.setVolume(0.3);
    back.loop("audio/musicaFondo.mp3");
    reproduceFondo.setVolume(0.3);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              FloatingText(
                text: 'Selecciona un lenguaje:',
                repeat: false,
                textStyle: TextStyle(
                  fontSize: 28,
                  fontFamily: "Love",
                  color: Colors.black,
                ),
                floatingTextStyle: TextStyle(
                  color: Colors.red,
                  fontFamily:"Love",
                  fontSize: 28,
                  shadows: [
                    BoxShadow(
                      color: Colors.yellow,
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                //color: Color(0xFF1A237E),
                  child: Column(children: <Widget>[
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange[900]),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10)),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange[800]),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.orange)))),
                        child: Text('Español',
                            style: TextStyle(
                              fontFamily: "Love",
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 40,
                            )),
                        onPressed: () {
                          AudioBanio=sonidoObjetosEspaniolBanio;
                          AudioCocina=sonidoObjetosEspaniolCocina;
                          AudioRecamara=sonidoObjetosEspaniolRecamara;

                          intruccionesAux=intruccionesEsp;

                          AudioBanioFrases=FrasesBanioEsp;
                          AudioRecamaraFrases=FrasesRecamaraEsp;
                          AudioCocinaFrases=FrasesCocinaEsp;

                          Navigator.of(context).push(createRoute());
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange[900]),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10)),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange[800]),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.orange)))),
                        child: Text('Ñuu Davi',
                            style: TextStyle(
                              fontFamily: "Love",
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 40,
                            )),
                        onPressed: () {
                          AudioBanio=sonidoObjetosMixtecoBanio;
                          AudioCocina=sonidoObjetosMixtecoCocina;
                          AudioRecamara=sonidoObjetosMixtecoRecamara;

                          intruccionesAux=intruccionesMixteco;

                          AudioBanioFrases=FrasesBanioEsp;
                          AudioRecamaraFrases=FrasesRecamaraEsp;
                          AudioCocinaFrases=FrasesCocinaEsp;
                          Navigator.of(context).push(createRoute());
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange[900]),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10)),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange[800]),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: BorderSide(color: Colors.orange)))),
                        child: Text('Diidxazá',
                            style: TextStyle(
                              fontFamily: "Love",
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 40,
                            )),
                        onPressed: () {
                          AudioBanio=sonidoObjetosEspaniolBanio;
                          AudioCocina=sonidoObjetosEspaniolCocina;
                          AudioRecamara=sonidoObjetosEspaniolRecamara;

                          intruccionesAux=intruccionesZapoteco;

                          AudioBanioFrases=FrasesBanioEsp;
                          AudioRecamaraFrases=FrasesRecamaraEsp;
                          AudioCocinaFrases=FrasesCocinaEsp;
                          Navigator.of(context).push(createRoute());
                        })
                  ])),
              LogoCard(
                image: "assets/images/mango.gif",
              ),
              Text("Por UTMitas",
                  style:TextStyle(
                    fontFamily: "Love",
                    letterSpacing: 0.9,
                    fontSize: 20,
                  )),
            ],
          )),
    );
  }
}

class LogoCard extends StatelessWidget {
  const LogoCard({
    Key key,
    this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        alignment: Alignment.topLeft,
        width: size.width * 1,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Escenario(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
