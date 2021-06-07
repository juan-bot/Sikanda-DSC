import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/BaseAppBar.dart';
import '../../AlertasEmergentes/AlertaInstruccionesProductos.dart';
import '../../Constantes.dart';
import '../../InfoObjetosEscenario/Recamara.dart';
import 'ItemCardObjetosRecamara.dart';

class ListarObjetosRecamara extends StatefulWidget {
  Color color;
  ListarObjetosRecamara(Color color);
  @override
  ObjetosRecamaraScreen createState() => ObjetosRecamaraScreen(this.color);
}

class ObjetosRecamaraScreen extends State<ListarObjetosRecamara>{
  Color color;
  ObjetosRecamaraScreen(this.color);

  @override
  void initState() {
    super.initState();
   // WidgetsBinding.instance.addPostFrameCallback((_) => MostrarInformacion(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange[800],
      appBar: getAppBar("Recámara", 1, context),
      body: ObjetosRecamara(),
    );
  }
 
}
class ObjetosRecamara extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: objetosRecam.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//numero de columnas
                 mainAxisSpacing: 0,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCardRecamara(
                  recamara: objetosRecam[index],
                )),
          ),
        ),
      ],
    );
  }
}