import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_pantalla.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_pantalla.dart';
import 'package:web_laptops/src/services/servicios_rest_pantalla.dart';

class PaginaDetallesPantallaSesionIniciada extends StatefulWidget {
  String idRegistro;

  PaginaDetallesPantallaSesionIniciada(this.idRegistro);

  @override
  State<StatefulWidget> createState() =>
      _PaginaDetallesPantallaSesionIniciada();
}

class _PaginaDetallesPantallaSesionIniciada
    extends State<PaginaDetallesPantallaSesionIniciada> {
  late Pantalla _pantalla;

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
        future: obtenerPantalla(widget.idRegistro),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Ha ocurrido un error"
                  " al conectar al servidor intentelo mas tarde"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            _pantalla = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Detalles componente: Pantalla',
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
                                text: _pantalla.getModelo(),
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
                                'Resolucion: ',
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
                                text: _pantalla.getResolucion(),
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
                              child: Text('Calidad: ', style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _pantalla.getCalidad(),
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
                              child: Text('Tipo de pantalla: ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _pantalla.getTipoPantalla(),
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
                              child: Text('Tama??o en pulgadas: ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _pantalla.getTamanio(),
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
                              child: Text('Frecuencia de refresco (Hz): ',
                                  style: estiloTexto),
                              margin: EdgeInsets.all(15)),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              decoration: decoracionCamposTexto,
                              readOnly: true,
                              controller: TextEditingController(
                                text: _pantalla
                                    .getFrecuenciaRefresco()
                                    .toString(),
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
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaginaEspecificarPantalla(_pantalla),
                              ),
                            )
                          },
                          child: Text('Modificar Pantalla'),
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
