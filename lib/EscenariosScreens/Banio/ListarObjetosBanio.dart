import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/BaseAppBar.dart';
import '../../AlertasEmergentes/AlertaInstruccionesProductos.dart';
import '../../Constantes.dart';
import 'ItemCardObjetosBanio.dart';
import '../../InfoObjetosEscenario/Banio.dart';

class ListarObjetosBanio extends StatefulWidget {
  Color color;
  ListarObjetosBanio(Color color);
  @override
  ObjetosBanioScreen createState() => ObjetosBanioScreen(this.color);
}

class ObjetosBanioScreen extends State<ListarObjetosBanio>{
  Color color;
  ObjetosBanioScreen(this.color);
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => MostrarInformacion(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Baño", 1, context),
      body: ObjetosBanio(),
    );
  }
}
class ObjetosBanio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top : 15.0,left: 40,bottom: 15),
         
        ),
        Expanded(
          child:Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: objetosBanio.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//numero de columnas
                 mainAxisSpacing: 0,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCardBanio(
                  banio: objetosBanio[index],
                )),
          )),
        ),
      ],
    );
  }
}