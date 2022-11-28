import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_almacenamiento.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/pages/detailsComponent/pagina_detalles_componente_memoria_ram.dart';
import 'package:web_laptops/src/pages/detailsComponent/pagina_detalles_componente_pantalla_sesion_no_iniciada.dart';
import 'package:web_laptops/src/pages/detailsComponent/pagina_detalles_componente_procesador_sesion_no_iniciada.dart';
import 'package:web_laptops/src/pages/detailsComponent/pagina_detalles_componente_tarjeta_video.dart';
import 'package:web_laptops/src/services/servicios_rest_almacenamiento.dart';

class PaginaDetallesLaptopSesionNoIniciada extends StatefulWidget {
  Laptop laptop;

  PaginaDetallesLaptopSesionNoIniciada(this.laptop);

  @override
  State<StatefulWidget> createState() =>
      _PaginaDetallesLaptopSesionNoIniciada();
}

class _PaginaDetallesLaptopSesionNoIniciada
    extends State<PaginaDetallesLaptopSesionNoIniciada> {
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
          child: Text(
            'Detalles de laptop',
            style: estiloEncabezado,
          ),
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
                                  PaginaDetallesProcesadorNoSesion(
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
                                  PaginaDetallesTarjetaVideoNoSesion(
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
                                  PaginaDetallesMemoriaRamNoSesion(
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
                    onPressed: (() => {}),
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
                          onChanged: null,
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
                                  PaginaDetallesPantallaNoSesion(
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
        ),
        ElevatedButton(
          onPressed: () => {
            Navigator.pop(context, false),
          },
          child: Text('Cerrar'),
        )
      ],
    ));
  }
}
