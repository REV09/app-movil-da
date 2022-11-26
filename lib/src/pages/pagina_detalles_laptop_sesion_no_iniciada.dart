import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            'Detalles de laptop',
            style: estiloEncabezado,
          ),
          alignment: AlignmentDirectional.center,
          margin: EdgeInsets.all(20),
        ),
        Container(
          margin: EdgeInsets.all(10),
          alignment: AlignmentDirectional.center,
          constraints: BoxConstraints(maxWidth: 500, maxHeight: 450),
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
                    onPressed: (() => {}),
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
                    onPressed: (() => {}),
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
                    onPressed: (() => {}),
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
                    onPressed: (() => {}),
                    child: Text(
                      widget.laptop.getPantalla(),
                      style: estiloBotonTexto,
                    ),
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black)),
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
