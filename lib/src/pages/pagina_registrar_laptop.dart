import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_almacenamiento.dart';
import 'package:web_laptops/src/classes/clase_hdd.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/classes/clase_memoria_ram.dart';
import 'package:web_laptops/src/classes/clase_pantalla.dart';
import 'package:web_laptops/src/classes/clase_procesador.dart';
import 'package:web_laptops/src/classes/clase_ssd.dart';
import 'package:web_laptops/src/classes/clase_tarjeta_video.dart';
import 'package:web_laptops/src/services/servicios_rest_almacenamiento.dart';
import 'package:web_laptops/src/services/servicios_rest_hdd.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_memoria_ram.dart';
import 'package:web_laptops/src/services/servicios_rest_pantalla.dart';
import 'package:web_laptops/src/services/servicios_rest_procesador.dart';
import 'package:web_laptops/src/services/servicios_rest_ssd.dart';
import 'package:web_laptops/src/services/servicios_rest_tarjeta_video.dart';

class PaginaRegistrarLaptop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaRegistrarLaptop();
}

class _PaginaRegistrarLaptop extends State<PaginaRegistrarLaptop> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  bool? checkValue = false;

  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoProcesador = TextEditingController();
  TextEditingController controladorCampoTarjetaVideo = TextEditingController();
  TextEditingController controladorCampoPantalla = TextEditingController();
  TextEditingController controladorCampoAlmacenamiento =
      TextEditingController();
  TextEditingController controladorCampoMemoriaRam = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Registrar nueva Laptop',
              style: estiloTituloTexto,
            ),
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(left: 30.0, top: 15.0, right: 15.0),
          ),
          Container(
            width: 580,
            height: 70,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text(
                          'Marca y modelo: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(10)),
                    SizedBox(
                      width: 400,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoModelo,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 1100,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        alignment: AlignmentDirectional.center,
                        height: 40,
                        child: Text(
                          'Procesador: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoProcesador,
                      ),
                    ),
                    Container(
                      child: SizedBox(width: 50),
                    ),
                    Container(
                        child: Text(
                          'Ram: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoMemoriaRam,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Tarjeta de video: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoTarjetaVideo,
                      ),
                    ),
                    Container(
                      child: SizedBox(width: 50),
                    ),
                    Container(
                        child: Text(
                          'Pantalla: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoPantalla,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Almacenamiento: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoAlmacenamiento,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: checkValue,
                        onChanged: (bool? value) {
                          setState(() {
                            checkValue = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('SSD', style: estiloTexto),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: AlignmentDirectional.center,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(25),
                  alignment: AlignmentDirectional.centerStart,
                  child: ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Cancelar Registro"),
                                content: Text(
                                    "¿Estas seguro de cancelar el registro?\n"
                                    "\nNo se realizan cambios en el sistema"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Aceptar"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                    child: Text("cancelar"),
                                  )
                                ],
                              ),
                          barrierDismissible: false);
                    },
                    child: Text('Cancelar', style: estiloTexto),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, minimumSize: Size(40, 50)),
                  ),
                ),
                Expanded(child: SizedBox(width: 7)),
                Expanded(child: SizedBox(width: 7)),
                Container(
                  margin: EdgeInsets.all(25),
                  //height: 30,
                  alignment: AlignmentDirectional.centerEnd,
                  child: ElevatedButton(
                    onPressed: () async {
                      Laptop laptop = Laptop(
                        "idRegistro",
                        controladorCampoModelo.text,
                        controladorCampoMemoriaRam.text,
                        controladorCampoTarjetaVideo.text,
                        controladorCampoPantalla.text,
                        controladorCampoProcesador.text,
                        controladorCampoAlmacenamiento.text,
                      );
                      late Laptop respuestaLaptop;
                      late Pantalla pantalla;
                      late MemoriaRam memoriaRam;
                      late Procesador procesador;
                      late Almacenamiento almacenamiento;
                      late TarjetaVideo tarjetaVideo;
                      late Hdd discoDuro;
                      late Ssd estadoSolido;
                      try {
                        respuestaLaptop = await agregarLaptop(laptop);
                        if (respuestaLaptop.getModelo() == laptop.getModelo()) {
                          String tipoAlmacenamiento;
                          String idRegistro = respuestaLaptop.getIdRegistro();
                          if (checkValue == true) {
                            estadoSolido = Ssd.ssdVacio();
                            estadoSolido.setIdRegistro(idRegistro);
                            tipoAlmacenamiento = "SSD";
                            agregarSsd(estadoSolido);
                          } else {
                            discoDuro = Hdd.vacio();
                            discoDuro.setIdRegistro(idRegistro);
                            tipoAlmacenamiento = "HDD";
                            agregarHdd(discoDuro);
                          }
                          tarjetaVideo = TarjetaVideo.tarjetaVideoVacia();
                          tarjetaVideo.setIdRegistro(idRegistro);
                          almacenamiento =
                              Almacenamiento(idRegistro, tipoAlmacenamiento);
                          procesador = Procesador.procesadorVacio();
                          procesador.setIdRegistro(idRegistro);
                          memoriaRam = MemoriaRam.memoriaVacia();
                          memoriaRam.setIdRegistro(idRegistro);
                          pantalla = Pantalla.pantallaVacia();
                          pantalla.setIdRegistro(idRegistro);
                          agregarTarjetaVideo(tarjetaVideo);
                          agregarAlmacenamiento(almacenamiento);
                          agregarProcesador(procesador);
                          agregarMemoriaRam(memoriaRam);
                          agregarPantalla(pantalla);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Laptop registrada correctamente"),
                              content: Text(
                                  "Se ha registrado la laptop correctamente"
                                  "con\nel siguiente id de registro:\n"
                                  "${respuestaLaptop.getIdRegistro()}"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Aceptar"),
                                ),
                              ],
                            ),
                            barrierDismissible: false,
                          );
                        }
                      } catch (excepcion) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Laptop no registrada"),
                            content:
                                Text("ocurrio un error y no se pudo registrar\n"
                                    "la laptop por favor vuelva a intentar"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text("Aceptar"),
                              ),
                            ],
                          ),
                          barrierDismissible: false,
                        );
                      }
                    },
                    child: Text(
                      'Registrar Laptop',
                      style: estiloTexto,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(40, 50)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
