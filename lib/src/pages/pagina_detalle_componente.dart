import 'package:flutter/material.dart';

class PaginaDetalleComponente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaDetalleComponente();
}

class _PaginaDetalleComponente extends State<PaginaDetalleComponente> {
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
              child: Text('Detalles del componente'),
              alignment: AlignmentDirectional.center,
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: AlignmentDirectional.center,
              constraints: BoxConstraints(maxWidth: 400, maxHeight: 50),
              child: Text('Marca: Intel \nModelo: Intel Core i5 10500H'),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black))),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: AlignmentDirectional.center,
              constraints: BoxConstraints(maxWidth: 400, maxHeight: 50),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black))),
              child: ElevatedButton(
                onPressed: () => {},
                child: Text('Modificar componente'),
              ),
            ),
            ElevatedButton(onPressed: () => {}, child: Text('Cerrar'))
          ],
        ));
  }
}
