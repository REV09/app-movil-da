import 'package:flutter/material.dart';

class PaginaDetallesLaptop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaDetallesLaptop();
}

class _PaginaDetallesLaptop extends State<PaginaDetallesLaptop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('APP flutter Android mobile'),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade800,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text('Detalles de laptop'),
              alignment: AlignmentDirectional.centerStart,
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
                      onPressed: () => {},
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
                      onPressed: () => {},
                      child: Text('Eliminar Laptop'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red)),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: () => {}, child: Text('Cerrar'))
          ],
        ));
  }
}
