import 'package:flutter/material.dart';
import 'package:rompecabezas_sika/BaseAppBar.dart';
import '../escenarios.dart';
class Escenario extends StatefulWidget {
  final String title;
  Escenario({Key key, this.title}) : super(key: key);
  @override
  Instruccion createState() => Instruccion();
}

class Instruccion extends State<Escenario> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Sikanda", 0, context),
        //body:RadialExpansionDemo(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(height:1260,
              child:Center(child: RadialExpansionDemo())
          ),
        )
    );
  }
  
}