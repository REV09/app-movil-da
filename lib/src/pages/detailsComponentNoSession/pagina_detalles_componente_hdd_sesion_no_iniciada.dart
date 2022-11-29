import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_hdd.dart';
import 'package:web_laptops/src/services/servicios_rest_hdd.dart';

class PaginaDetallesHddNoSesion extends StatefulWidget {
  String idRegistro;

  PaginaDetallesHddNoSesion(this.idRegistro);

  @override
  State<StatefulWidget> createState() => new _PaginaDetallesHddNoSesion();
}

class _PaginaDetallesHddNoSesion extends State<PaginaDetallesHddNoSesion> {
  late Hdd _discoDuro;

  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);

  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: obtenerHdd(widget.idRegistro),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Ha ocurrido un error"
                  " al conectar al servidor intentelo mas tarde"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            _discoDuro = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Detalles componente: Disco duro',
                    style: estiloTituloTexto,
                  ),
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsets.only(left: 30.0, top: 15.0),
                ),
                Container(
                  width: 600,
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black, width: 2.0),
                      right: BorderSide(color: Colors.black, width: 2.0),
                      left: BorderSide(color: Colors.black, width: 2.0),
                      bottom: BorderSide(color: Colors.black, width: 2.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              alignment: AlignmentDirectional.center,
                              height: 40,
                              child: Text(
                                'Modelo: ',
                                style: estiloTexto,
                              ),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 200,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _discoDuro.getModelo(),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 40,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                'Marca: ',
                                style: estiloTexto,
                              ),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 350,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _discoDuro.getMarca(),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 40,
                              alignment: AlignmentDirectional.center,
                              child: Text('Capacidad: ', style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: '${_discoDuro.getCapacidad()} GB',
                              ),
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
                              child: Text('Tipo de Interfaz: ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _discoDuro.getInterfaz(),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 40,
                              alignment: AlignmentDirectional.center,
                              child:
                                  Text('Memoria Cache: ', style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: '${_discoDuro.getCache()} MB',
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 40,
                              alignment: AlignmentDirectional.center,
                              child: Text('Rpm (Revoluciones por minuto): ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                  text: '${_discoDuro.getRevoluciones()}'),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 40,
                              alignment: AlignmentDirectional.center,
                              child: Text('Tamaño del disco: ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _discoDuro.getTamanio(),
                              ),
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
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Regresar', style: estiloTexto),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
