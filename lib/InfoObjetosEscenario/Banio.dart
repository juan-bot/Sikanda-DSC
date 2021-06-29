import 'package:flutter/material.dart';

class Banio {
  final String image, title,imagen,mostrar,correcta,imgcorrecta,objeto,frase,imglugar,lugar;
  final int size, id,validos;
  final Color color;
  final List<String> opciones,imagenes,imagenes2,imagenes3;
  Banio({
    this.id,
    this.image,
    this.title,
    this.size,
    this.color,
    this.imagen,
    this.mostrar,
    this.imagenes,
    this.imagenes2,
    this.imagenes3,
    this.validos,
    this.lugar,
    this.frase,
    this.imglugar,
    this.opciones,
    this.imgcorrecta,
    this.objeto,
    this.correcta
  });
}
List<Banio> objetosBanio = [
  Banio(
      id: 1,
      title: "Cepillo Dental",
      size: 12,
      image: "assets/images/banio/cepillo.png",
      color: Color(0xFF01A2C6),
      ///////Juego Palabras/////////////
      ///
      imagen: "assets/images/banio/accion/1.png",
      mostrar: "Pedro usa un -- para lavarse los dientes",
      opciones: [
        "mesa",
        "jabon",
        "cobija",
        "taza",
        "plato",
        "cepillo dental",
      ],
      imagenes: [
        "assets/images/cocina/mesa.png",
        "assets/images/banio/jabon.png",
        "assets/images/recamara/cobertor.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/plato.png",
        "assets/images/banio/cepillo.png",
      ],
      correcta: "cepillo dental",
      //////////Juego Tobjetos/////
      imagenes2:[
        "assets/images/cocina/mesa.png--mesa",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/cobertor.png--cobertor",
        "assets/images/cocina/taza.png--taza",
        "assets/images/cocina/plato.png--plato",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/cazuela.png--cazuela",
        "assets/images/banio/labavo.png--lavabo",
      ] ,
      objeto: "el cepillo dental",
      imgcorrecta: "cepillo dental",
      ///////////////////juego AdondePertenecen////////////////
      imagenes3:[
        "assets/images/banio/jabon.png--jabon--baño",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/pasta.png--pasta dental--baño",
        "assets/images/banio/cepillo.png--cepillo dental--baño",
        "assets/images/cocina/cazuela.png--cazuela--cocina",
        "assets/images/banio/labavo.png--lavabo--baño",
      ],
      validos:4,
      lugar:"baño",
      frase:"el baño",
      imglugar: "assets/images/baño.png"

  ),
  Banio(
      id: 2,
      title: "Inodoro",
      size: 8,
      image: "assets/images/banio/inodoro.png",
      color: Color(0xFFD15A05),
      imagen: "assets/images/banio/accion/2.png",
      mostrar: "En el baño hay un --",
      opciones: [
        "cazuela",
        "pasta dental",
        "inodoro",
        "mesa",
        "plato",
        "taza",
      ],
      imagenes: [
        "assets/images/cocina/cazuela.png",
        "assets/images/banio/pasta.png",
        "assets/images/banio/inodoro.png",
        "assets/images/cocina/mesa.png",
        "assets/images/cocina/plato.png",
        "assets/images/cocina/taza.png",
      ],
      correcta: "inodoro",
      //////////Juego Tobjetos/////
      imagenes2:[
        "assets/images/cocina/estufa.png--estufas",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/espejo.png--espejo",
        "assets/images/cocina/vaso.png--vaso",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/cazuela.png--cazuela",
        "assets/images/banio/inodoro.png--inodoro",
        "assets/images/cocina/plato.png--plato",

      ] ,
      objeto: "el inodoro",
      imgcorrecta: "inodoro",
      ///////////////////juego AdondePertenecen////////////////
      imagenes3:[
        "assets/images/banio/jabon.png--jabon--baño",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/inodoro.png--inodoro--baño",
        "assets/images/recamara/lampara.png--lampara--baño",
        "assets/images/cocina/estufa.png--estufas--cocina",
        "assets/images/banio/labavo.png--lavabo--baño",
      ],
      validos:3,
      lugar:"baño",
      frase:"el baño",
      imglugar: "assets/images/baño.png"


  ),
  Banio(
      id: 3,
      title: "Jabon",
      size: 10,
      image: "assets/images/banio/jabon.png",
      color: Color(0xFF953d68),
      imagen: "assets/images/banio/accion/3.png",
      mostrar: "Dany se lava sus manos con --",
      opciones: [
        "vaso",
        "jabon",
        "almohada",
        "taza",
        "plato",
        "estufa",
      ],
      imagenes: [
        "assets/images/cocina/vaso.png",
        "assets/images/banio/jabon.png",
        "assets/images/recamara/almohada.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/plato.png",
        "assets/images/cocina/estufa.png",
        "assets/images/banio/cepillo.png",
      ],
      correcta: "jabon",
      //////////Juego Tobjetos/////
      imagenes2:[
        "assets/images/cocina/taza.png--taza",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/cama.png--cama",
        "assets/images/cocina/plato.png--plato",
        "assets/images/cocina/mesa.png--mesa",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/vaso.png--vaso",
        "assets/images/banio/labavo.png--lavabo",
      ] ,
      objeto: "el jabon ",
      imgcorrecta: "jabon",
      ///////////////////juego AdondePertenecen////////////////
      imagenes3:[
        "assets/images/banio/jabon.png--jabon--baño",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/inodoro.png--inodoro--baño",
        "assets/images/cocina/taza.png--taza--cocina",
        "assets/images/banio/pasta.png--pasta dental--baño",
        "assets/images/banio/shampoo.png--shampoo--baño",
      ],
      validos:4,
      lugar:"baño",
      frase:"el baño",
      imglugar: "assets/images/baño.png"

  ),
  Banio(
      id: 4,
      title: "Lavabo",
      size: 11,
      image: "assets/images/banio/labavo.png",
      color: Color(0xFFf9AC34),
      imagen: "assets/images/banio/accion/4.png",
      mostrar: "Ramon se lava su cara en el --",
      opciones: [
        "mesa",
        "cama",
        "lavabo",
        "taza",
        "vaso",
        "estufa",
      ],
      imagenes: [
        "assets/images/cocina/mesa.png",
        "assets/images/recamara/cama.png",
        "assets/images/banio/labavo.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/vaso.png",
        "assets/images/cocina/estufa.png",
      ],
      correcta: "lavabo",
      //////////Juego Tobjetos/////
      imagenes2:[
        "assets/images/cocina/mesa.png--mesa",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/almohada.png--almohada",
        "assets/images/cocina/estufa.png--estufa",
        "assets/images/cocina/vaso.png--vaso",
        "assets/images/banio/pasta.png--pasta",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/cazuela.png--cazuela",
        "assets/images/banio/labavo.png--lavabo",
      ] ,
      objeto: "el lavabo",
      imgcorrecta: "lavabo",
      ///////////////////juego AdondePertenecen////////////////
      imagenes3:[
        "assets/images/banio/cepillo.png--cepillo dental--baño",
        "assets/images/recamara/espejo.png--espejo--recamara",
        "assets/images/banio/shampoo.png--shampoo--baño",
        "assets/images/recamara/armario.png--armario --recamara",
        "assets/images/cocina/cazuela.png--cazuela--cocina",
        "assets/images/banio/labavo.png--lavabo--baño",
      ],
      validos:3,
      lugar:"baño",
      frase:"el baño",
      imglugar: "assets/images/baño.png"

  ),
  Banio(
      id: 5,
      title: "Pasta Dental",
      size: 28,
      image: "assets/images/banio/pasta.png",
      color: Color(0xFFad2c34),
      imagen: "assets/images/banio/accion/5.png",
      mostrar: "Adrian usa -- para lavar sus dientes.",
      opciones: [
        "mesa",
        "jabon",
        "lampara",
        "taza",
        "pasta dental",
        "espejo",
      ],
      imagenes: [
        "assets/images/cocina/mesa.png",
        "assets/images/banio/jabon.png",
        "assets/images/recamara/lampara.png",
        "assets/images/cocina/taza.png",
        "assets/images/banio/pasta.png",
        "assets/images/recamara/espejo.png",
      ],
      correcta: "pasta dental",
      //////////Juego Tobjetos/////
      imagenes2:[
        "assets/images/cocina/cazuela.png--cazuela",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/armario.png--armario",
        "assets/images/cocina/taza.png--taza",
        "assets/images/cocina/estufa.png--estufas",
        "assets/images/banio/pasta.png--pasta dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/vaso.png--vaso",
        "assets/images/banio/labavo.png--lavabo",
      ] ,
      objeto: "la pasta dental",
      imgcorrecta: "pasta dental",
      ///////////////////juego AdondePertenecen////////////////
      imagenes3:[
        "assets/images/banio/jabon.png--jabon--baño",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/cocina/mesa.png--mesa--cocina",
        "assets/images/banio/pasta.png--pasta dental--baño",
        "assets/images/cocina/cazuela.png--cazuela--cocina",
        "assets/images/banio/labavo.png--lavabo--baño",
      ],
      validos:3,
      lugar:"baño",
      frase:"el baño",
      imglugar: "assets/images/baño.png"

  ),
  Banio(
      id: 6,
      title: "Shampoo",
      size: 12,
      image: "assets/images/banio/shampoo.png",
      color: Color(0xFF205134),
      imagen: "assets/images/banio/accion/6.png",
      mostrar: "Sara se lava el cabello con --",
      opciones: [
        "estufa",
        "shampoo",
        "cobija",
        "taza",
        "plato",
        "mesa",
      ],
      imagenes: [
        "assets/images/cocina/estufa.png",
        "assets/images/banio/shampoo.png",
        "assets/images/recamara/cobertor.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/plato.png",
        "assets/images/cocina/mesa.png",
      ],
      correcta: "shampoo",
      //////////Juego Tobjetos/////
      imagenes2:[
        "assets/images/cocina/plato.png--plato",
        "assets/images/banio/shampoo.png--shampoo",
        "assets/images/recamara/cobertor.png--cobertor",
        "assets/images/cocina/vaso.png--vaso",
        "assets/images/cocina/cazuela.png--cazuela",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/taza.png--taza",
        "assets/images/banio/labavo.png--lavabo",
      ] ,
      objeto: "el shampoo",
      imgcorrecta: "shampoo",
      ///////////////////juego AdondePertenecen////////////////
      imagenes3:[
        "assets/images/banio/shampoo.png--jabon--baño",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/pasta.png--pasta dental--baño",
        "assets/images/banio/cepillo.png--cepillo--baño",
        "assets/images/cocina/taza.png--taza--cocina",
        "assets/images/banio/labavo.png--lavabo--baño",
      ],
      validos:4,
      lugar:"baño",
      frase:"el baño",
      imglugar: "assets/images/baño.png"

  ),
];