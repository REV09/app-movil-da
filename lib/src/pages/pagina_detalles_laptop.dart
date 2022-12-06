import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/pages/detailsComponentWithSession/pagina_detalles_componente_hdd_sesion_iniciada.dart';
import 'package:web_laptops/src/pages/detailsComponentWithSession/pagina_detalles_componente_memoria_ram_sesion_iniciada.dart';
import 'package:web_laptops/src/pages/detailsComponentWithSession/pagina_detalles_componente_pantalla_sesion_iniciada.dart';
import 'package:web_laptops/src/pages/detailsComponentWithSession/pagina_detalles_componente_procesador_sesion_iniciada.dart';
import 'package:web_laptops/src/pages/detailsComponentWithSession/pagina_detalles_componente_ssd_sesion_iniciada.dart';
import 'package:web_laptops/src/pages/detailsComponentWithSession/pagina_detalles_componente_tarjeta_video_sesion_iniciada.dart';
import 'package:web_laptops/src/pages/pagina_modificar_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_hdd.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_memoria_ram.dart';
import 'package:web_laptops/src/services/servicios_rest_pantalla.dart';
import 'package:web_laptops/src/services/servicios_rest_procesador.dart';
import 'package:web_laptops/src/services/servicios_rest_ssd.dart';
import 'package:web_laptops/src/services/servicios_rest_tarjeta_video.dart';
import '../classes/clase_almacenamiento.dart';
import '../services/servicios_rest_almacenamiento.dart';

class PaginaDetallesLaptop extends StatefulWidget {
  Laptop laptop;

  PaginaDetallesLaptop(this.laptop);

  @override
  State<StatefulWidget> createState() => _PaginaDetallesLaptop();
}

class _PaginaDetallesLaptop extends State<PaginaDetallesLaptop> {
  TextStyle estiloTexto = TextStyle(
      fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);

  TextStyle estiloBotonTexto =
      TextStyle(fontSize: 18, fontStyle: FontStyle.normal);

  TextStyle estiloEncabezado =
      TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);

  bool ssd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.all(20),
            child: Text('Detalles de laptop'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: AlignmentDirectional.center,
            constraints: BoxConstraints(maxWidth: 500, maxHeight: 450),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'ID de registro:  ',
                      style: estiloTexto,
                    ),
                    Text(
                      widget.laptop.getIdRegistro(),
                      style: estiloTexto,
                    ),
                  ],
                ),
                Container(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Modelo ',
                      style: estiloTexto,
                    ),
                    TextButton(
                      onPressed: (() => {}),
                      child: Text(
                        widget.laptop.getModelo(),
                        style: estiloBotonTexto,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Procesador ',
                      style: estiloTexto,
                    ),
                    TextButton(
                      onPressed: (() => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaginaDetallesProcesadorSesionIniciada(
                                        widget.laptop.idRegistro),
                              ),
                            )
                          }),
                      child: Text(
                        widget.laptop.getProcesador(),
                        style: estiloBotonTexto,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Tarjeta de video ',
                      style: estiloTexto,
                    ),
                    TextButton(
                      onPressed: (() => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaginaDetallesTarjetaVideoSesionIniciada(
                                        widget.laptop.idRegistro),
                              ),
                            )
                          }),
                      child: Text(
                        widget.laptop.getTarjetaVideo(),
                        style: estiloBotonTexto,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Memoria Ram ',
                      style: estiloTexto,
                    ),
                    TextButton(
                      onPressed: (() => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaginaDetallesMemoriaRamSesionIniciada(
                                        widget.laptop.idRegistro),
                              ),
                            )
                          }),
                      child: Text(
                        widget.laptop.getMemoriaRam(),
                        style: estiloBotonTexto,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Almacenamiento ',
                      style: estiloTexto,
                    ),
                    TextButton(
                      onPressed: (() => {
                            if (ssd)
                              {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaginaDetallesSsdSesionIniciada(
                                            widget.laptop.idRegistro),
                                  ),
                                )
                              }
                            else
                              {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaginaDetallesHddSesionIniciada(
                                            widget.laptop.idRegistro),
                                  ),
                                )
                              }
                          }),
                      child: Text(
                        widget.laptop.getAlmacenamiento(),
                        style: estiloBotonTexto,
                      ),
                    ),
                    FutureBuilder(
                      future:
                          obtenerAlmacenamiento(widget.laptop.getIdRegistro()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("ND"),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          Almacenamiento almacenamiento = snapshot.data!;
                          if (almacenamiento.getTipoAlmacenamiento() == 'SSD') {
                            ssd = true;
                          }
                          return Checkbox(
                            value: ssd,
                            onChanged: (value) {},
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    Text(
                      'SSD',
                      style: estiloTexto,
                    )
                  ],
                ),
                Container(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Pantalla ',
                      style: estiloTexto,
                    ),
                    TextButton(
                      onPressed: (() => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaginaDetallesPantallaSesionIniciada(
                                        widget.laptop.idRegistro),
                              ),
                            )
                          }),
                      child: Text(
                        widget.laptop.getPantalla(),
                        style: estiloBotonTexto,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: AlignmentDirectional.center,
            constraints: BoxConstraints(maxWidth: 420, maxHeight: 50),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: AlignmentDirectional.centerStart,
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaginaModificarLaptop(),
                        ),
                      )
                    },
                    child: Text('Modificar Laptop'),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: AlignmentDirectional.centerEnd,
                  child: ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Eliminar Laptop"),
                                content: Text(
                                    "¿Estas seguro de eliminar la laptop?\n"
                                    "\nEsta accion no se puede deshacer"),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      String idRegistroLaptop =
                                          widget.laptop.getIdRegistro();
                                      try {
                                        await eliminarLaptop(idRegistroLaptop);
                                        await eliminarMemoriaRam(
                                            idRegistroLaptop);
                                        await eliminarAlmacenamiento(
                                            idRegistroLaptop);
                                        await eliminarPantalla(
                                            idRegistroLaptop);
                                        await eliminarProcesador(
                                            idRegistroLaptop);
                                        await eliminarTarjetaVideo(
                                            idRegistroLaptop);
                                        if (ssd) {
                                          await eliminarSsd(idRegistroLaptop);
                                        } else {
                                          await eliminarHdd(idRegistroLaptop);
                                        }
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Laptop eliminada"),
                                            content:
                                                Text("Se ha eliminado la laptop"
                                                    " correctamente"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context, true);
                                                  Navigator.pop(context, true);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Aceptar"),
                                              ),
                                            ],
                                          ),
                                          barrierDismissible: false,
                                        );
                                      } catch (excepcion) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Laptop no eliminada"),
                                            content: Text(
                                                "Ha ocurrido un error de"
                                                "conexion\ny no se ha podido"
                                                "eliminar la laptop"),
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
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red)),
                    child: Text('Eliminar Laptop'),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text('Cerrar'),
          )
        ],
      ),
    );
  }
}
