import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/classes/clase_memoria_ram.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_memoria_ram.dart';

class PaginaEspecificarRam extends StatefulWidget {
  MemoriaRam memoriaRam;

  PaginaEspecificarRam(this.memoriaRam);

  @override
  State<StatefulWidget> createState() => _PaginaEspecificarRam();
}

class _PaginaEspecificarRam extends State<PaginaEspecificarRam> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  TextEditingController controladorCampoMarca = TextEditingController();
  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoTipoMemoria = TextEditingController();
  TextEditingController controladorCampoCantidadRam = TextEditingController();
  TextEditingController controladorCampoNumeroMemorias =
      TextEditingController();
  TextEditingController controladorCampoVelocidad = TextEditingController();
  TextEditingController controladorCampoEcc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoMarca.text = widget.memoriaRam.getMarca();
    controladorCampoModelo.text = widget.memoriaRam.getModelo();
    controladorCampoTipoMemoria.text = widget.memoriaRam.getTipoMemoria();
    controladorCampoCantidadRam.text =
        widget.memoriaRam.getCantidadMemoria().toString();
    controladorCampoNumeroMemorias.text =
        widget.memoriaRam.getCantidadMemorias().toString();
    controladorCampoVelocidad.text =
        widget.memoriaRam.getVelocidad().toString();
    controladorCampoEcc.text = asignarEcc();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(
                'Especificar componente: Memoria Ram',
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
                  bottom: BorderSide(color: Colors.black, width: 2.0)),
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
                        child: Text('Tipo de memoria: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoTipoMemoria,
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
                        child: Text('Cantidad de ram: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoCantidadRam,
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
                        child: Text('N. de memorias: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoNumeroMemorias,
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
                        child: Text('Velocidad (mhz): ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoVelocidad,
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
                        child: Text('ecc: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoEcc,
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
                      bool tipoMemoriaValido =
                          validarCampoAlfanumericoSinEspacios(
                              controladorCampoTipoMemoria.text);
                      bool cantidadMemoriaValido = validarCampoNumeroEntero(
                          controladorCampoCantidadRam.text);
                      bool numeroMemoriasValido = validarCampoNumeroEntero(
                          controladorCampoNumeroMemorias.text);
                      bool velocidadValido = validarCampoNumeroEntero(
                          controladorCampoVelocidad.text);
                      if (modeloValido &&
                          marcaValida &&
                          tipoMemoriaValido &&
                          cantidadMemoriaValido &&
                          numeroMemoriasValido &&
                          velocidadValido) {
                        MemoriaRam memoriaRamActualizada = MemoriaRam(
                          widget.memoriaRam.getIdRegistro(),
                          controladorCampoModelo.text,
                          controladorCampoMarca.text,
                          controladorCampoTipoMemoria.text,
                          int.parse(controladorCampoCantidadRam.text),
                          int.parse(controladorCampoNumeroMemorias.text),
                          int.parse(controladorCampoVelocidad.text),
                          esEcc(),
                        );
                        try {
                          Laptop laptopNueva = await obtenerLaptopPorId(
                              widget.memoriaRam.getIdRegistro());
                          laptopNueva
                              .setMemoriaRam(memoriaRamActualizada.getModelo());
                          MemoriaRam memoriaRamRespuesta =
                              await modificarMemoriaRam(memoriaRamActualizada,
                                  memoriaRamActualizada.getIdRegistro());
                          if (memoriaRamActualizada.getIdRegistro() ==
                              memoriaRamRespuesta.getIdRegistro()) {
                            modificarLaptop(
                                laptopNueva, laptopNueva.getIdRegistro());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    "memoria ram actualizada correctamente"),
                                content: Text("Se ha actualizado la memoria ram"
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
                              title: Text("memoria ram no actualizada"),
                              content: Text(
                                  "ocurrio un error y no se pudo actualizar\n"
                                  "la memoria ram por favor vuelva a intentar"),
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
                          tipoMemoriaValido &&
                          cantidadMemoriaValido &&
                          numeroMemoriasValido &&
                          velocidadValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Modelo de memoria ram invalido"),
                            content: Text(
                                "El modelo de memoria ram ingresado es invalido\n"
                                "corrigalo, solo use letras, numeros y espacios\n"
                                "o guiones, si no conoce esta informacion solo\n"
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
                          !marcaValida &&
                          tipoMemoriaValido &&
                          cantidadMemoriaValido &&
                          numeroMemoriasValido &&
                          velocidadValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("marca de memoria ram invalida"),
                            content: Text(
                                "El marca de memoria ram ingresado es invalido\n"
                                "corrigalo, solo use letras para especificarlo\n"
                                "si no conoce esta informacion solo escriba ND"),
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
                          !tipoMemoriaValido &&
                          cantidadMemoriaValido &&
                          numeroMemoriasValido &&
                          velocidadValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Tipo de memoria ram invalida"),
                            content: Text(
                                "El tipo de memoria ram ingresado es invalido\n"
                                "corrigalo, solo use letras y numeros para\n"
                                "especificar;p si no conoce esta informacion\n"
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
                          marcaValida &&
                          tipoMemoriaValido &&
                          !cantidadMemoriaValido &&
                          numeroMemoriasValido &&
                          velocidadValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Cantidad de memoria invalida"),
                            content: Text(
                                "La cantidad de memoria ingresado es invalida\n"
                                "corrigalo, solo use numeros para especificarlo\n"
                                " si no conoce esta informacion escriba ND"),
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
                          tipoMemoriaValido &&
                          cantidadMemoriaValido &&
                          !numeroMemoriasValido &&
                          velocidadValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Numero de memorias invalida"),
                            content: Text(
                                "El numero de memorias ingresado es invalido\n"
                                "corrigalo, solo use numeros para especificarlo\n"
                                " si no conoce esta informacion escriba ND"),
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
                          tipoMemoriaValido &&
                          cantidadMemoriaValido &&
                          numeroMemoriasValido &&
                          !velocidadValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Velocidad de memoria invalida"),
                            content: Text(
                                "La velocidad de memoria ingresada es invalida\n"
                                "corrigalo, solo use numeros enteros para\n"
                                "especificarlo si no conoce esta informacion\n"
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

  String asignarEcc() {
    if (widget.memoriaRam.getEcc() == 0) {
      return "No";
    }
    return "Si";
  }

  int esEcc() {
    if (controladorCampoEcc.text == "Si") {
      return 1;
    }
    return 0;
  }
}
