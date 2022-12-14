import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/classes/clase_pantalla.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_pantalla.dart';

class PaginaEspecificarPantalla extends StatefulWidget {
  Pantalla pantalla;

  PaginaEspecificarPantalla(this.pantalla);

  @override
  State<StatefulWidget> createState() => _PaginaEspecificarPantalla();
}

class _PaginaEspecificarPantalla extends State<PaginaEspecificarPantalla> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoResolucion = TextEditingController();
  TextEditingController controladorCampoCalidad = TextEditingController();
  TextEditingController controladorCampoTipoPantalla = TextEditingController();
  TextEditingController controladorCampoTamanio = TextEditingController();
  TextEditingController controladorCampoFrecuencia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoModelo.text = widget.pantalla.getModelo();
    controladorCampoResolucion.text = widget.pantalla.getResolucion();
    controladorCampoCalidad.text = widget.pantalla.getCalidad();
    controladorCampoTipoPantalla.text = widget.pantalla.getTipoPantalla();
    controladorCampoTamanio.text = widget.pantalla.getTamanio();
    controladorCampoFrecuencia.text =
        widget.pantalla.getFrecuenciaRefresco().toString();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(
                'Especificar componente: Pantalla',
                style: estiloTituloTexto,
              ),
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(left: 30.0, top: 15.0)),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Modelo: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoModelo,
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
                        child: Text('Resolucion: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoResolucion,
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
                        child: Text('Calidad: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoCalidad,
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
                        child: Text('Tipo de pantalla: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoTipoPantalla,
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
                        child: Text('Tama??o: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoTamanio,
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
                        child: Text('Frecuencia de refresco: ',
                            style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoFrecuencia,
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
                                    "??Estas seguro de cancelar la operacion?\n"
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
                      if (validarCampoAlfanumericoEspacios(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoGuiones(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoSinEspacios(
                              controladorCampoModelo.text)) {
                        modeloValido = true;
                      }
                      bool resolucionValida = validarCampoAlfanumericoEspacios(
                          controladorCampoResolucion.text);
                      bool calidadValida = validarCampoLetrasSinEspacios(
                          controladorCampoCalidad.text);
                      bool tipoValido = validarCampoLetrasSinEspacios(
                          controladorCampoTipoPantalla.text);
                      bool tamanioValido = false;
                      if (validarCampoNumeroDecimal(
                              controladorCampoTamanio.text) ||
                          validarCampoNumeroEntero(
                              controladorCampoTamanio.text)) {
                        tamanioValido = false;
                      }
                      bool frecuenciaValida = validarCampoNumeroEntero(
                          controladorCampoFrecuencia.text);
                      if (modeloValido &&
                          resolucionValida &&
                          calidadValida &&
                          tipoValido &&
                          tamanioValido &&
                          frecuenciaValida) {
                        Pantalla pantallaActualizada = Pantalla(
                          widget.pantalla.getIdRegistro(),
                          controladorCampoModelo.text,
                          controladorCampoResolucion.text,
                          controladorCampoCalidad.text,
                          controladorCampoTipoPantalla.text,
                          controladorCampoTamanio.text,
                          int.parse(controladorCampoFrecuencia.text),
                        );
                        try {
                          Laptop laptopNueva = await obtenerLaptopPorId(
                              widget.pantalla.getIdRegistro());
                          laptopNueva
                              .setPantalla(pantallaActualizada.getModelo());
                          Pantalla pantallaRespuesta = await modificarPantalla(
                              pantallaActualizada,
                              pantallaActualizada.getIdRegistro());
                          if (pantallaActualizada.getIdRegistro() ==
                              pantallaRespuesta.getIdRegistro()) {
                            modificarLaptop(
                                laptopNueva, laptopNueva.getIdRegistro());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title:
                                    Text("Pantalla actualizado correctamente"),
                                content: Text("Se ha actualizado la pantalla"
                                    " correctamente"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                      Navigator.of(context).pop();
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
                              title: Text("Pantalla no actualizada"),
                              content: Text(
                                  "ocurrio un error y no se pudo actualizar\n"
                                  "la pantalla por favor vuelva a intentarlo"),
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
                          resolucionValida &&
                          calidadValida &&
                          tipoValido &&
                          tamanioValido &&
                          frecuenciaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Modelo de pantalla no valido"),
                            content: Text(
                                "El modelo ingresado no es valido verifique\n"
                                "que la informacion sea correcta, ingrese\n"
                                "solo letras y numeros y no combiene espacios\n"
                                "y guiones si no conoces esta informacion solo\n"
                                "escriba ND"),
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
                          !resolucionValida &&
                          calidadValida &&
                          tipoValido &&
                          tamanioValido &&
                          frecuenciaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Resolucion de pantalla no valido"),
                            content: Text(
                                "La resolucion ingresada no es valido verifique\n"
                                "que la informacion sea correcta, ingrese\n"
                                "solo numeros y una x y no combiene espacios\n"
                                "y guiones si no conoces esta informacion solo\n"
                                "escriba ND"),
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
                          resolucionValida &&
                          !calidadValida &&
                          tipoValido &&
                          tamanioValido &&
                          frecuenciaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Calidad de pantalla no valido"),
                            content: Text(
                                "La calidad ingresada no es valido verifique\n"
                                "que la informacion sea correcta, ingrese\n"
                                "solo letras y no utilize espacios ni guiones,\n"
                                " si no conoces esta informacion solo\n"
                                "escriba ND"),
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
                          resolucionValida &&
                          calidadValida &&
                          !tipoValido &&
                          tamanioValido &&
                          frecuenciaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Tipo de pantalla no valido"),
                            content: Text(
                                "EL tipo ingresado no es valido verifique\n"
                                "que la informacion sea correcta, ingrese\n"
                                "solo letras y no utilize espacios ni guiones,\n"
                                " si no conoces esta informacion solo\n"
                                "escriba ND"),
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
                          resolucionValida &&
                          calidadValida &&
                          tipoValido &&
                          !tamanioValido &&
                          frecuenciaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Tama??o de pantalla no valido"),
                            content: Text(
                                "EL tama??o ingresado no es valido verifique\n"
                                "que la informacion sea correcta, ingrese\n"
                                "solo numeros y no utilize espacios ni guiones,\n"
                                " si no conoces esta informacion solo\n"
                                "escriba ND"),
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
                          resolucionValida &&
                          calidadValida &&
                          tipoValido &&
                          tamanioValido &&
                          !frecuenciaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Frecuencia de pantalla no valido"),
                            content: Text(
                                "La frecuencia ingresado no es valido verifique\n"
                                "que la informacion sea correcta, ingrese\n"
                                "solo numeros y no utilize espacios ni guiones,\n"
                                " si no conoces esta informacion solo\n"
                                "escriba ND"),
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
                      'Guardar',
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
