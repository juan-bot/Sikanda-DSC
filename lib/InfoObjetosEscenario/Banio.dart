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
      color: Color(0xFF3D82AE),
      ///////Juego Palabras/////////////
      imagen: "assets/images/banio/accion/1.jpg",
      mostrar: "Pedro usa un -- para lavarse los dientes",
      opciones: [
        "manzana",
        "jabon",
        "cobija",
        "taza",
        "plato",
        "cepillo dental",
      ],
      imagenes: [
        "assets/images/cocina/manzana.png",
        "assets/images/banio/jabon.png",
        "assets/images/recamara/cobertor.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/plato.png",
        "assets/images/banio/cepillo.png",
      ],
      correcta: "cepillo dental",
    //////////Juego Tobjetos/////
       imagenes2:[
        "assets/images/cocina/manzana.png--manzana",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/cobertor.png--cobertor",
        "assets/images/cocina/taza.png--taza",
        "assets/images/cocina/plato.png--plato",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/brocoli.png--brocoli",
        "assets/images/banio/labavo.png--lavabo",
       ] ,
       objeto: "el cepillo dental",
       imgcorrecta: "cepillo dental",
    ///////////////////juego AdondePertenecen////////////////
       imagenes3:[
        "assets/images/banio/jabon.png--jabon--bano",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/pasta.png--pasta dental--bano",
        "assets/images/banio/cepillo.png--cepillo dental--bano",
        "assets/images/cocina/brocoli.png--brocoli--cocina",
        "assets/images/banio/labavo.png--lavabo--bano",
       ],
       validos:4,
       lugar:"bano",
       frase:"el baño",
       imglugar: "assets/images/baño2.gif"

  ),
  Banio(
      id: 2,
      title: "Inodoro",
      size: 8,
      image: "assets/images/banio/inodoro.png",
      color: Color(0xFFD3A984),
      imagen: "assets/images/banio/accion/2.jpg",
      mostrar: "En el baño hay un --",
      opciones: [
        "brocoli",
        "pasta dental",
        "inodoro",
        "taza",
        "plato",
        "fresa",
      ],
      imagenes: [
        "assets/images/cocina/brocoli.png",
        "assets/images/banio/pasta.png",
        "assets/images/banio/inodoro.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/plato.png",
        "assets/images/cocina/fresa.png",
      ],
      correcta: "inodoro",
         //////////Juego Tobjetos/////
       imagenes2:[
        "assets/images/cocina/uva.png--uvas",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/espejo.png--espejo",
        "assets/images/cocina/platano.png--platano",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/brocoli.png--brocoli",
        "assets/images/banio/inodoro.png--inodoro",
        "assets/images/cocina/plato.png--plato",

       ] ,
       objeto: "el inodoro",
       imgcorrecta: "inodoro",
    ///////////////////juego AdondePertenecen////////////////
       imagenes3:[
        "assets/images/banio/jabon.png--jabon--bano",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/inodoro.png--inodoro--bano",
        "assets/imagesrecamara/lampara.png--lampara--bano",
        "assets/images/cocina/uva.png--uvas--cocina",
        "assets/images/banio/labavo.png--lavabo--bano",
       ],
       validos:3,
       lugar:"bano",
       frase:"el baño",
       imglugar: "assets/images/baño2.gif"

      
  ),
  Banio(
      id: 3,
      title: "Jabon",
      size: 10,
      image: "assets/images/banio/jabon.png",
      color: Color(0xFF989493),
      imagen: "assets/images/banio/accion/3.jpg",
      mostrar: "Dany se lava sus manos con --",
      opciones: [
        "platano",
        "jabon",
        "almohada",
        "taza",
        "plato",
        "uva",
      ],
      imagenes: [
        "assets/images/cocina/platano.png",
        "assets/images/banio/jabon.png",
        "assets/images/recamara/almohada.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/plato.png",
        "assets/images/cocina/uva.png",
        "assets/images/banio/cepillo.png",
      ],
      correcta: "jabon",
         //////////Juego Tobjetos/////
       imagenes2:[
        "assets/images/cocina/fresa.png--fresa",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/cama.png--cama",
        "assets/images/cocina/plato.png--plato",
        "assets/images/cocina/cuchara.png--cuchra",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/platano.png--platano",
        "assets/images/banio/labavo.png--lavabo",
       ] ,
       objeto: "el jabon ",
       imgcorrecta: "jabon",
    ///////////////////juego AdondePertenecen////////////////
       imagenes3:[
        "assets/images/banio/jabon.png--jabon--bano",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/inodoro.png--inodoro--bano",
        "assets/images/cocina/fresa.png--fresa--cocina",
        "assets/images/banio/pasta.png--pasta dental--bano",
        "assets/images/banio/shampoo.png--shampoo--bano",
       ],
       validos:4,
       lugar:"bano",
       frase:"el baño",
       imglugar: "assets/images/baño2.gif"

  ),
  Banio(
      id: 4,
      title: "Labavo",
      size: 11,
      image: "assets/images/banio/labavo.png",
      color: Color(0xFFE6B398),
      imagen: "assets/images/banio/accion/4.jpg",
      mostrar: "Ramon se lava su cara en el --",
      opciones: [
        "lechuga",
        "cama",
        "lavabo",
        "taza",
        "platano",
        "uva",
      ],
      imagenes: [
        "assets/images/cocina/lechuga.png",
        "assets/images/recamara/cama.png",
        "assets/images/banio/labavo.png",
        "assets/images/cocina/taza.png",
        "assets/images/cocina/platano.png",
        "assets/images/cocina/uva.png",
      ],
      correcta: "lavabo",
         //////////Juego Tobjetos/////
       imagenes2:[
        "assets/images/cocina/manzana.png--manzana",
        "assets/images/banio/jabon.png--jabon",
        "assets/images/recamara/almohada.png--almohada",
        "assets/images/cocina/uva.png--uva",
        "assets/images/cocina/platano.png--platano",
        "assets/images/banio/pasta.png--pasta",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/brocoli.png--brocoli",
        "assets/images/banio/labavo.png--lavabo",
       ] ,
       objeto: "el lavabo",
       imgcorrecta: "lavabo",
    ///////////////////juego AdondePertenecen////////////////
       imagenes3:[
        "assets/images/banio/cepillo.png--cepillo dental--bano",
        "assets/images/recamara/espejo.png--espejo--recamara",
        "assets/images/banio/shampoo.png--shampoo--bano",
        "assets/images/recamara/armario.png--armario --recamara",
        "assets/images/cocina/brocoli.png--brocoli--cocina",
        "assets/images/banio/labavo.png--lavabo--bano",
       ],
       validos:3,
       lugar:"bano",
       frase:"el baño",
       imglugar: "assets/images/baño2.gif"

  ),
  Banio(
      id: 5,
      title: "Pasta Dental",
      size: 28,
      image: "assets/images/banio/pasta.png",
      color: Color(0xFFFB7883),
      imagen: "assets/images/banio/accion/5.png",
      mostrar: "Adrian usa -- para lavar sus dientes.",
      opciones: [
        "manzana",
        "jabon",
        "lampara",
        "taza",
        "pasta dental",
        "espejo",
      ],
      imagenes: [
        "assets/images/cocina/manzana.png",
        "assets/images/banio/jabon.png",
        "assets/images/recamara/lampara.png",
        "assets/images/cocina/taza.png",
        "assets/images/banio/pasta.png",
        "assets/images/recamara/espejo.png",
      ],
      correcta: "pasta dental",
         //////////Juego Tobjetos/////
       imagenes2:[
        "assets/images/cocina/sandia.png--sandia",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/armario.png--armario",
        "assets/images/cocina/taza.png--taza",
        "assets/images/cocina/uva.png--uvas",
        "assets/images/banio/pasta.png--pasta dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/platano.png--platano",
        "assets/images/banio/labavo.png--lavabo",
       ] ,
       objeto: "la pasta dental",
       imgcorrecta: "pasta dental",
    ///////////////////juego AdondePertenecen////////////////
       imagenes3:[
        "assets/images/banio/jabon.png--jabon--bano",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/cocina/lechuga.png--lechuga--cocina",
        "assets/images/banio/pasta.png--pasta dental--bano",
        "assets/images/cocina/brocoli.png--brocoli--cocina",
        "assets/images/banio/labavo.png--lavabo--bano",
       ],
       validos:3,
       lugar:"bano",
       frase:"el baño",
       imglugar: "assets/images/baño2.gif"

  ),
  Banio(
    id: 6,
    title: "Shampoo",
    size: 12,
    image: "assets/images/banio/shampoo.png",
    color: Color(0xFFAEAEAE),
    imagen: "assets/images/banio/accion/6.png",
    mostrar: "Sara se lava el cabello con --",
    opciones: [
      "uva",
      "shampoo",
      "cobija",
      "taza",
      "plato",
      "cuchara",
    ],
    imagenes: [
      "assets/images/cocina/uva.png",
      "assets/images/banio/shampoo.png",
      "assets/images/recamara/cobertor.png",
      "assets/images/cocina/taza.png",
      "assets/images/cocina/plato.png",
      "assets/images/cocina/cuchara.png",
    ],
    correcta: "shampoo",
       //////////Juego Tobjetos/////
       imagenes2:[
        "assets/images/cocina/plato.png--plato",
        "assets/images/banio/shampoo.png--shampoo",
        "assets/images/recamara/cobertor.png--cobertor",
        "assets/images/cocina/taza.png--taza",
        "assets/images/cocina/plato.png--plato",
        "assets/images/banio/cepillo.png--cepillo dental",
        "assets/images/recamara/lampara.png--lampara",
        "assets/images/cocina/fresa.png--fresa",
        "assets/images/banio/labavo.png--lavabo",
       ] ,
       objeto: "el shampoo",
       imgcorrecta: "shampoo",
    ///////////////////juego AdondePertenecen////////////////
       imagenes3:[
        "assets/images/banio/shampoo.png--jabon--bano",
        "assets/images/recamara/cobertor.png--cobertor--recamara",
        "assets/images/banio/pasta.png--pasta dental--bano",
        "assets/images/banio/cepillo.png--cepillo--bano",
        "assets/images/cocina/fresa.png--fresa--cocina",
        "assets/images/banio/labavo.png--lavabo--bano",
       ],
       validos:4,
       lugar:"bano",
       frase:"el baño",
       imglugar: "assets/images/baño2.gif"

  ),
];

