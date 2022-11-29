import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_procesador.dart';
import 'package:web_laptops/src/services/servicios_rest_procesador.dart';

class PaginaDetallesProcesadorSesionIniciada extends StatefulWidget {
  String idRegistro;

  PaginaDetallesProcesadorSesionIniciada(this.idRegistro);

  @override
  State<StatefulWidget> createState() =>
      new _PaginaDetallesProcesadorSesionIniciada();
}

class _PaginaDetallesProcesadorSesionIniciada
    extends State<PaginaDetallesProcesadorSesionIniciada> {
  late Procesador _procesador;

  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);

  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    obtenerProcesador(widget.idRegistro).then(
      (value) => _procesador = value,
    );
    return Scaffold(
      body: FutureBuilder(
        future: obtenerProcesador(widget.idRegistro),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Ha ocurrido un error"
                  " al conectar al servidor intentelo mas tarde"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Detalles componente: Procesador',
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
                                'Marca: ',
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
                                text: _procesador.getMarca(),
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
                                'Modelo: ',
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
                                text: _procesador.getModelo(),
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
                              child: Text('N. Nucleos: ', style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _procesador.getNumeroNucleos().toString(),
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
                              child: Text('N. Hilos: ', style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _procesador.getNumeroHilos().toString(),
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
                              child: Text('Velocidad Maxima: ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text:
                                    _procesador.getVelocidadMaxima().toString(),
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
                              child: Text('Velocidad Minima: ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text:
                                    _procesador.getVelocidadMinima().toString(),
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
                              child: Text('Litografia: ', style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _procesador.getLitografia().toString(),
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
                          child: Text('Modificar Procesador'),
                        ),
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
