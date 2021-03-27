import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => MostrarInformacion(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orange[800],
      appBar: buildAppBar(context),
      body: ObjetosBanio(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF9D2929),
      //backgroundColor: Colors.orange[900],
      title: Text('Objetos',
        style: TextStyle(
          fontSize: 30,
          fontFamily: "Love",
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.help_outline,
            size: 40,
          ),
          tooltip: 'Ver instrucciones',
          onPressed: () {
            MostrarInformacion(context);
          },
        )
      ],
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
          child: Text(
            "Baño",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: objetosBanio.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//numero de columnas
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCardBanio(
                  banio: objetosBanio[index],
                )),
          ),
        ),
      ],
    );
  }
}