import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../AlertasEmergentes/AlertaInstruccionesProductos.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => MostrarInformacion(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orange[800],
      appBar: buildAppBar(context),
      body: ObjetosCocina(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF9D2929),
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
class ObjetosCocina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Cocina",
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
                itemCount: objetos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//numero de columnas
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
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
