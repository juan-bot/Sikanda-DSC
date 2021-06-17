import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'Lifecycle.dart';
import 'SeleccionIdiomas.dart';

void main() async => {
  WidgetsFlutterBinding.ensureInitialized(),
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ), // To turn off landscape mode
  runApp(MyApp())
};
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Center(
            child: SplashScreen(),
          ),
        )
    );
  }
}
//pagina presentacion del logo y nombre del juego
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
              width: 250.0,
              child: SplashScreenView(
                home: Idiomas(),
                duration: 10000,
                imageSize: 300,
                imageSrc: "assets/images/puz.gif",
                text: "Sikanda",
                textType: TextType.TyperAnimatedText,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Love",
                  color: Colors.blue,
                  fontSize: 50.0,
                ),
                backgroundColor: Colors.white,
              )),
        ));
  }

}