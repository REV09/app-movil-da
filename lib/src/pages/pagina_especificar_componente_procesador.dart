import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/classes/clase_procesador.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_procesador.dart';

class PaginaEspecificarProcesador extends StatefulWidget {
  Procesador procesador;

  PaginaEspecificarProcesador(this.procesador);

  @override
  State<StatefulWidget> createState() => _PaginaEspecificarProcesador();
}

class _PaginaEspecificarProcesador extends State<PaginaEspecificarProcesador> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);

  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  TextEditingController controladorCampoMarca = TextEditingController();
  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoNucleos = TextEditingController();
  TextEditingController controladorCampoHilos = TextEditingController();
  TextEditingController controladorCampoVelocidadMaxima =
      TextEditingController();
  TextEditingController controladorCampoVelocidadMinima =
      TextEditingController();
  TextEditingController controladorCampoLitografia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoMarca.text = widget.procesador.getMarca();
    controladorCampoModelo.text = widget.procesador.getModelo();
    controladorCampoNucleos.text =
        widget.procesador.getNumeroHilos().toString();
    controladorCampoHilos.text = widget.procesador.getNumeroHilos().toString();
    controladorCampoVelocidadMaxima.text =
        widget.procesador.getVelocidadMaxima().toString();
    controladorCampoVelocidadMinima.text =
        widget.procesador.getVelocidadMinima().toString();
    controladorCampoLitografia.text =
        widget.procesador.getLitografia().toString();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Especificar componente: Procesador',
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                        controller: controladorCampoMarca,
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
                        child: Text('N. Nucleos: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoNucleos,
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
                        controller: controladorCampoHilos,
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
                        child: Text('Velocidad Maxima: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoVelocidadMaxima,
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
                        child: Text('Velocidad Minima: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoVelocidadMinima,
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
                        controller: controladorCampoLitografia,
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
                                title: Text("Cancelar"),
                                content: Text(
                                    "¿Estas seguro de cancelar la operacion?\n"
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
                          validarCampoLetrasSinEspacios(
                              controladorCampoModelo.text)) {
                        modeloValido = true;
                      }
                      bool marcaValida = validarCampoLetrasSinEspacios(
                          controladorCampoMarca.text);
                      bool nucleosValidos = validarCampoNumeroEntero(
                          controladorCampoNucleos.text);
                      bool hilosValidos =
                          validarCampoNumeroEntero(controladorCampoHilos.text);
                      bool velocidadMaximaValida = validarCampoNumeroDecimal(
                          controladorCampoVelocidadMaxima.text);
                      bool velocidadMinimaValida = validarCampoNumeroDecimal(
                          controladorCampoVelocidadMinima.text);
                      bool litografiaValida = validarCampoNumeroEntero(
                          controladorCampoLitografia.text);
                      if (modeloValido &&
                          marcaValida &&
                          nucleosValidos &&
                          hilosValidos &&
                          velocidadMaximaValida &&
                          velocidadMinimaValida &&
                          litografiaValida) {
                        Procesador procesadorActualizado = Procesador(
                          widget.procesador.getIdRegistro(),
                          controladorCampoModelo.text,
                          controladorCampoMarca.text,
                          int.parse(controladorCampoNucleos.text),
                          int.parse(controladorCampoHilos.text),
                          double.parse(controladorCampoVelocidadMaxima.text),
                          double.parse(controladorCampoVelocidadMinima.text),
                          int.parse(controladorCampoLitografia.text),
                        );
                        try {
                          Laptop laptopNueva = await obtenerLaptopPorId(
                              widget.procesador.getIdRegistro());
                          laptopNueva.setProcesador(
                              " ${procesadorActualizado.getModelo()}");
                          Procesador procesadorRespuesta =
                              await modificarProcesador(procesadorActualizado,
                                  procesadorActualizado.getIdRegistro());
                          if (procesadorActualizado.getIdRegistro() ==
                              procesadorRespuesta.getIdRegistro()) {
                            modificarLaptop(
                                laptopNueva, laptopNueva.getIdRegistro());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    "Procesador actualizado correctamente"),
                                content: Text("Se ha actualizado el procesador"
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
                              title: Text("Procesador no actualizado"),
                              content: Text(
                                  "ocurrio un error y no se pudo actualizar\n"
                                  "el procesador por favor vuelva a intentar"),
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
                          marcaValida &&
                          nucleosValidos &&
                          hilosValidos &&
                          velocidadMaximaValida &&
                          velocidadMinimaValida &&
                          litografiaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Modelo de procesador invalido"),
                            content: Text(
                                "El modelo del procesador ingresado es invalido\n"
                                "corrigalo, solo use letras y numeros para\n"
                                "especificar si no conoce esta informacion\n"
                                "solo escriba ND"),
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
                          !marcaValida &&
                          nucleosValidos &&
                          hilosValidos &&
                          velocidadMaximaValida &&
                          velocidadMinimaValida &&
                          litografiaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Marca de procesador invalido"),
                            content: Text(
                                "La marca del procesador ingresado es invalido\n"
                                "corrigalo, solo use letras especificar\n"
                                " si no conoce esta informacion solo escriba \n"
                                "ND"),
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
                          marcaValida &&
                          !nucleosValidos &&
                          hilosValidos &&
                          velocidadMaximaValida &&
                          velocidadMinimaValida &&
                          litografiaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Nucleos de procesador invalido"),
                            content: Text(
                                "Los nucleos del procesador ingresado son invalidos\n"
                                "corrigalo, solo use numeros especificarlo\n"
                                " si no conoce esta informacion solo escriba \n"
                                "0"),
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
                          marcaValida &&
                          nucleosValidos &&
                          !hilosValidos &&
                          velocidadMaximaValida &&
                          velocidadMinimaValida &&
                          litografiaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Hilos de procesador invalido"),
                            content: Text(
                                "Los hilos del procesador ingresado son invalidos\n"
                                "corrigalo, solo use numeros especificarlo\n"
                                " si no conoce esta informacion solo escriba \n"
                                "0"),
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
                          marcaValida &&
                          nucleosValidos &&
                          hilosValidos &&
                          !velocidadMaximaValida &&
                          velocidadMinimaValida &&
                          litografiaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:
                                Text("velocidad Maxima de procesador invalido"),
                            content: Text(
                                "la velocidad maxima del procesador ingresado es invalida\n"
                                "corrigalo, solo use numeros decimales para especificarlo\n"
                                " si no conoce esta informacion solo escriba 0.0"),
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
                          marcaValida &&
                          nucleosValidos &&
                          hilosValidos &&
                          velocidadMaximaValida &&
                          !velocidadMinimaValida &&
                          litografiaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:
                                Text("velocidad Minima de procesador invalido"),
                            content: Text(
                                "la velocidad minima del procesador ingresado es invalida\n"
                                "corrigalo, solo use numeros decimales para especificarlo\n"
                                " si no conoce esta informacion solo escriba 0.0"),
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
                          marcaValida &&
                          nucleosValidos &&
                          hilosValidos &&
                          velocidadMaximaValida &&
                          velocidadMinimaValida &&
                          !litografiaValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Litografia de procesador invalido"),
                            content: Text(
                                "la litografia del procesador ingresado es invalida\n"
                                "corrigalo, solo use numeros enteros para especificarlo\n"
                                " si no conoce esta informacion solo escriba 0"),
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
