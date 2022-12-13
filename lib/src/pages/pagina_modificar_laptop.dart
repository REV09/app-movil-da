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
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';

class PaginaModificarLaptop extends StatefulWidget {
  Laptop laptopAnterior;
  bool ssd;

  PaginaModificarLaptop(this.laptopAnterior, this.ssd);

  @override
  State<StatefulWidget> createState() => _PaginaModificarLaptop(ssd);
}

class _PaginaModificarLaptop extends State<PaginaModificarLaptop> {
  bool checkValue;

  _PaginaModificarLaptop(this.checkValue);

  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoProcesador = TextEditingController();
  TextEditingController controladorCampoTarjetaVideo = TextEditingController();
  TextEditingController controladorCampoPantalla = TextEditingController();
  TextEditingController controladorCampoAlmacenamiento =
      TextEditingController();
  TextEditingController controladorCampoMemoriaRam = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoModelo.text = widget.laptopAnterior.getModelo();
    controladorCampoProcesador.text = widget.laptopAnterior.getProcesador();
    controladorCampoTarjetaVideo.text = widget.laptopAnterior.getTarjetaVideo();
    controladorCampoPantalla.text = widget.laptopAnterior.getPantalla();
    controladorCampoAlmacenamiento.text =
        widget.laptopAnterior.getAlmacenamiento();
    controladorCampoMemoriaRam.text = widget.laptopAnterior.getMemoriaRam();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(
                'Modificar Laptop',
                style: estiloTituloTexto,
              ),
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(left: 30.0, top: 15.0)),
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
                        margin: EdgeInsets.all(5)),
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
                                    "¿Estas seguro de cancelar la accion?\n"
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
                  alignment: AlignmentDirectional.centerEnd,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool modeloValido = false;
                      if (validarCampoAlfanumericoGuiones(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoEspacios(
                              controladorCampoModelo.text)) {
                        modeloValido = true;
                      }
                      bool memoriaValida = false;
                      if (validarCampoAlfanumericoGuiones(
                            controladorCampoMemoriaRam.text,
                          ) ||
                          validarCampoAlfanumericoEspacios(
                            controladorCampoMemoriaRam.text,
                          )) {
                        memoriaValida = true;
                      }
                      bool tarjetaValida = false;
                      if (validarCampoAlfanumericoGuiones(
                            controladorCampoTarjetaVideo.text,
                          ) ||
                          validarCampoAlfanumericoEspacios(
                            controladorCampoTarjetaVideo.text,
                          )) {
                        tarjetaValida = true;
                      }
                      bool pantallaValida = false;
                      if (validarCampoAlfanumericoGuiones(
                            controladorCampoPantalla.text,
                          ) ||
                          validarCampoAlfanumericoEspacios(
                            controladorCampoPantalla.text,
                          )) {
                        pantallaValida = true;
                      }
                      bool procesadorValido = false;
                      if (validarCampoAlfanumericoGuiones(
                            controladorCampoProcesador.text,
                          ) ||
                          validarCampoAlfanumericoEspacios(
                            controladorCampoProcesador.text,
                          )) {
                        procesadorValido = true;
                      }
                      bool almacenamientoValido = false;
                      if (validarCampoAlfanumericoGuiones(
                            controladorCampoAlmacenamiento.text,
                          ) ||
                          validarCampoAlfanumericoEspacios(
                            controladorCampoAlmacenamiento.text,
                          )) {
                        almacenamientoValido = true;
                      }
                      if (modeloValido &&
                          memoriaValida &&
                          tarjetaValida &&
                          pantallaValida &&
                          procesadorValido &&
                          almacenamientoValido) {
                        Laptop laptopActualizada = Laptop(
                          widget.laptopAnterior.getIdRegistro(),
                          controladorCampoModelo.text,
                          controladorCampoMemoriaRam.text,
                          controladorCampoTarjetaVideo.text,
                          controladorCampoPantalla.text,
                          controladorCampoProcesador.text,
                          controladorCampoAlmacenamiento.text,
                        );
                        Almacenamiento almacenamiento;
                        late Hdd discoDuro;
                        late Ssd estadoSolido;
                        try {
                          Laptop respuestaLaptop = await modificarLaptop(
                            laptopActualizada,
                            laptopActualizada.getIdRegistro(),
                          );
                          if (respuestaLaptop.getIdRegistro() ==
                              laptopActualizada.getIdRegistro()) {
                            String? tipoAlmacenamiento;
                            String idRegistro = respuestaLaptop.getIdRegistro();
                            if (checkValue && !widget.ssd) {
                              estadoSolido = Ssd.ssdVacio();
                              estadoSolido.setIdRegistro(idRegistro);
                              tipoAlmacenamiento = "SSD";
                              agregarSsd(estadoSolido);
                              eliminarHdd(idRegistro);
                              almacenamiento = Almacenamiento(
                                idRegistro,
                                tipoAlmacenamiento,
                              );
                              modificarAlmacenamiento(
                                  almacenamiento, idRegistro);
                            } else if (!checkValue && widget.ssd) {
                              discoDuro = Hdd.vacio();
                              discoDuro.setIdRegistro(idRegistro);
                              tipoAlmacenamiento = "HDD";
                              agregarHdd(discoDuro);
                              eliminarSsd(idRegistro);
                              almacenamiento = Almacenamiento(
                                idRegistro,
                                tipoAlmacenamiento,
                              );
                              modificarAlmacenamiento(
                                  almacenamiento, idRegistro);
                            } else {
                              if (laptopActualizada.getAlmacenamiento() !=
                                  widget.laptopAnterior.getAlmacenamiento()) {
                                if (tipoAlmacenamiento == "HDD") {
                                  Hdd hddAnterior =
                                      await obtenerHdd(idRegistro);
                                  hddAnterior.setModelo(
                                      laptopActualizada.getAlmacenamiento());
                                  agregarHdd(hddAnterior);
                                } else {
                                  Ssd ssdAnterior =
                                      await obtenerSsd(idRegistro);
                                  ssdAnterior.setModelo(
                                      laptopActualizada.getAlmacenamiento());
                                  agregarSsd(ssdAnterior);
                                }
                              }
                            }
                            if (laptopActualizada.getMemoriaRam() !=
                                widget.laptopAnterior.getMemoriaRam()) {
                              MemoriaRam memoriaRamAnterior =
                                  await obtenerMemoriaRam(idRegistro);
                              memoriaRamAnterior
                                  .setModelo(laptopActualizada.getMemoriaRam());
                              modificarMemoriaRam(
                                  memoriaRamAnterior, idRegistro);
                            }
                            if (laptopActualizada.getPantalla() !=
                                widget.laptopAnterior.getPantalla()) {
                              Pantalla pantallaAnterior =
                                  await obtenerPantalla(idRegistro);
                              pantallaAnterior
                                  .setModelo(laptopActualizada.getPantalla());
                              modificarPantalla(pantallaAnterior, idRegistro);
                            }
                            if (laptopActualizada.getProcesador() !=
                                widget.laptopAnterior.getProcesador()) {
                              Procesador procesadorAnterior =
                                  await obtenerProcesador(idRegistro);
                              procesadorAnterior
                                  .setModelo(laptopActualizada.getProcesador());
                              modificarProcesador(
                                  procesadorAnterior, idRegistro);
                            }
                            if (laptopActualizada.getTarjetaVideo() !=
                                widget.laptopAnterior.getTarjetaVideo()) {
                              TarjetaVideo tarjetaVideoAnterior =
                                  await obtenerTarjetaVideo(idRegistro);
                              tarjetaVideoAnterior.setModelo(
                                  laptopActualizada.getTarjetaVideo());
                              modificarTarjetaVideo(
                                  tarjetaVideoAnterior, idRegistro);
                            }
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Laptop actualizada correctamente"),
                                content: Text(
                                    "Se ha actualizado la laptop correctamente"
                                    "con\nel siguiente id de registro:\n"
                                    "${respuestaLaptop.getIdRegistro()}"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                      Navigator.of(context).pop();
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
                              title: Text("Laptop no actualizada"),
                              content: Text(
                                  "ocurrio un error y no se pudo actualizar\n"
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
                      } else if (!modeloValido &&
                          memoriaValida &&
                          tarjetaValida &&
                          pantallaValida &&
                          procesadorValido &&
                          almacenamientoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Modelo de laptop no valido"),
                            content: Text("El modelo ingresado no es valido\n"
                                "corrigalo, asegurese de no combinar guiones y\n"
                                "espacios solo use 1 de dos"),
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
                      } else if (modeloValido &&
                          !memoriaValida &&
                          tarjetaValida &&
                          pantallaValida &&
                          procesadorValido &&
                          almacenamientoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Memoria ram no valida"),
                            content: Text(
                                "la memoria ram ingresada no es valida\n"
                                "corrigala, asegurese de no combinar guiones y\n"
                                "espacios solo use 1 de dos"),
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
                      } else if (modeloValido &&
                          memoriaValida &&
                          !tarjetaValida &&
                          pantallaValida &&
                          procesadorValido &&
                          almacenamientoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Tarjeta de video no valido"),
                            content: Text("La tarjeta de video no es valida\n"
                                "corrigalo, asegurese de no combinar guiones y\n"
                                "espacios solo use 1 de dos"),
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
                      } else if (modeloValido &&
                          memoriaValida &&
                          tarjetaValida &&
                          !pantallaValida &&
                          procesadorValido &&
                          almacenamientoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Pantalla de laptop no valida"),
                            content: Text("La pantalla ingresada no es valida\n"
                                "corrigalo, asegurese de no combinar guiones y\n"
                                "espacios solo use 1 de dos"),
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
                      } else if (modeloValido &&
                          memoriaValida &&
                          tarjetaValida &&
                          pantallaValida &&
                          !procesadorValido &&
                          almacenamientoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Procesador de laptop no valido"),
                            content: Text(
                                "El modelo de procesador ingresado no es valido\n"
                                "corrigalo, asegurese de no combinar guiones y\n"
                                "espacios solo use 1 de dos"),
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
                      } else if (modeloValido &&
                          memoriaValida &&
                          tarjetaValida &&
                          pantallaValida &&
                          procesadorValido &&
                          !almacenamientoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("almacenamiento de laptop no valido"),
                            content: Text(
                                "El almacenamiento ingresado no es valido\n"
                                "corrigalo, asegurese de no combinar guiones y\n"
                                "espacios solo use 1 de dos"),
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
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Registro de laptop no valido"),
                            content: Text(
                                "Mas de un campo contiene infomacion no valida\n"
                                "Por favor verfique y corriga esta informacion"),
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
                      'Actualizar',
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
