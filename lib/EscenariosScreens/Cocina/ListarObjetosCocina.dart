import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/BaseAppBar.dart';
import '../../Constantes.dart';
import 'ItemCardObjetosCocina.dart';
import '../../InfoObjetosEscenario/Cocina.dart';

class ListarObjetosCocina extends StatefulWidget {
  Color color;
  ListarObjetosCocina(Color color);
  @override
  ObjetosCocinaScreen createState() => ObjetosCocinaScreen(this.color);
}

class ObjetosCocinaScreen extends State<ListarObjetosCocina>{
  Color color;
  ObjetosCocinaScreen(this.color);

  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => MostrarInformacion(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orange[800],
      appBar: getAppBar("Cocina", 1, context),
      body: ObjetosCocina(),
    );
  }
}
class ObjetosCocina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top : 15.0,left: 40,bottom: 15),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: objetos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//numero de columnas
                 mainAxisSpacing: 0,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCardCocina(
                  cocina: objetos[index],
                )),
          ),
        ),
      ],
    );
  }
}