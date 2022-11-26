import 'package:flutter/material.dart';

class PaginaDetallesLaptopSesionNoIniciada extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _PaginaDetallesLaptopSesionNoIniciada();
}

class _PaginaDetallesLaptopSesionNoIniciada
    extends State<PaginaDetallesLaptopSesionNoIniciada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text('Detalles de laptop'),
          alignment: AlignmentDirectional.center,
          margin: EdgeInsets.all(20),
        ),
        Container(
          margin: EdgeInsets.all(10),
          alignment: AlignmentDirectional.center,
          constraints: BoxConstraints(maxWidth: 300, maxHeight: 350),
          child: Text('Marca: Lenovo' +
              '\nModelo: ThinkPad T430L' +
              '\nProcesador: correo@gmail.com' +
              '\nTarjeta de video: TipoUsuario' +
              '\nMemoria Ram: MemoriaRam' +
              '\nAlmacenamiento: Almacenamiento HDD' +
              '\nPantalla: Pantalla Laptop'),
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
