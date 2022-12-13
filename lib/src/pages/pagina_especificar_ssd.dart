import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/classes/clase_ssd.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_ssd.dart';

class PaginaEspecificarSsd extends StatefulWidget {
  Ssd ssd;

  PaginaEspecificarSsd(this.ssd);

  @override
  State<StatefulWidget> createState() => _PaginaEspecificarSsd();
}

class _PaginaEspecificarSsd extends State<PaginaEspecificarSsd> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  TextEditingController controladorCampoMarca = TextEditingController();
  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoCapacidad = TextEditingController();
  TextEditingController controladorCampoForma = TextEditingController();
  TextEditingController controladorCampoDurabilidad = TextEditingController();
  TextEditingController controladorCampoTipoMemorias = TextEditingController();
  TextEditingController controladorCampoGeneracion = TextEditingController();
  TextEditingController controladorCampoVelocidadLectura =
      TextEditingController();
  TextEditingController controladorCampoVelocidadEscritura =
      TextEditingController();
  TextEditingController controladorCampoProtocolo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoMarca.text = widget.ssd.getMarca();
    controladorCampoModelo.text = widget.ssd.getModelo();
    controladorCampoCapacidad.text = widget.ssd.getCapacidad().toString();
    controladorCampoForma.text = widget.ssd.getFactorForma();
    controladorCampoDurabilidad.text = widget.ssd.getDurabilidad();
    controladorCampoTipoMemorias.text = widget.ssd.getTipoMemorias();
    controladorCampoGeneracion.text = widget.ssd.getGeneracionMemorias();
    controladorCampoVelocidadLectura.text = widget.ssd.getVelocidadLectura();
    controladorCampoVelocidadEscritura.text =
        widget.ssd.getVelocidadEscritura();
    controladorCampoProtocolo.text = widget.ssd.getProtocolo();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(
                'Especificar componente: Almacenamiento(SSD)',
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
                          controller: controladorCampoMarca),
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
                        child: Text('Capacidad: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                          decoration: decoracionCamposTexto,
                          controller: controladorCampoCapacidad),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Factor de forma: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                          decoration: decoracionCamposTexto,
                          controller: controladorCampoForma),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Durabilidad: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                          decoration: decoracionCamposTexto,
                          controller: controladorCampoDurabilidad),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Tipo de memorias solidas ',
                            style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoTipoMemorias,
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
                        child: Text('Generacion de memorias: ',
                            style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoGeneracion,
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
                            Text('Velocidad de lectura: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoVelocidadLectura,
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
                        child: Text('Velocidad de escritura: ',
                            style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoVelocidadEscritura,
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
                        child: Text('Protocolo de transferencia: ',
                            style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoProtocolo,
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
                                    "¿Estas seguro de cancelar el registro?\n"
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
                      bool marcaValida = false;
                      if (validarCampoAlfanumericoSinEspacios(
                          controladorCampoMarca.text)) {
                        marcaValida = true;
                      }
                      bool modeloValido = false;
                      if (validarCampoAlfanumericoEspacios(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoGuiones(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoSinEspacios(
                              controladorCampoModelo.text)) {
                        modeloValido = true;
                      }
                      bool capacidadValida = false;
                      if (validarCampoNumeroEntero(
                          controladorCampoCapacidad.text)) {
                        capacidadValida = true;
                      }
                      bool formaValida = false;
                      if (validarCampoNumeroEntero(
                              controladorCampoForma.text) ||
                          validarCampoLetrasSinEspacios(
                              controladorCampoForma.text)) {
                        formaValida = true;
                      }
                      bool durabilidadValida = false;
                      if (validarCampoAlfanumericoEspacios(
                              controladorCampoDurabilidad.text) ||
                          validarCampoLetrasSinEspacios(
                              controladorCampoForma.text)) {
                        durabilidadValida = true;
                      }
                      bool tipoMemoriaValida = false;
                      if (validarCampoLetrasSinEspacios(
                          controladorCampoTipoMemorias.text)) {
                        tipoMemoriaValida = true;
                      }
                      bool generacionValida = false;
                      if (validarCampoLetrasSinEspacios(
                          controladorCampoGeneracion.text)) {
                        generacionValida = true;
                      }
                      bool velocidadLecuturaValida = false;
                      if (validadVelocidadSistema(
                              controladorCampoVelocidadLectura.text) ||
                          validarCampoLetrasSinEspacios(
                              controladorCampoVelocidadLectura.text)) {
                        velocidadLecuturaValida = true;
                      }
                      bool velocidadEscrituraValida = false;
                      if (validadVelocidadSistema(
                              controladorCampoVelocidadEscritura.text) ||
                          validarCampoLetrasSinEspacios(
                              controladorCampoVelocidadEscritura.text)) {
                        velocidadEscrituraValida = true;
                      }
                      bool protocoloValido = false;
                      if (validarCampoAlfanumericoDecimalEspacios(
                              controladorCampoProtocolo.text) ||
                          validarCampoLetrasSinEspacios(
                              controladorCampoProtocolo.text)) {
                        protocoloValido = true;
                      }
                      if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        Ssd ssdActualizado = Ssd(
                          widget.ssd.getIdRegistro(),
                          controladorCampoMarca.text,
                          controladorCampoModelo.text,
                          int.parse(controladorCampoCapacidad.text),
                          controladorCampoForma.text,
                          controladorCampoDurabilidad.text,
                          controladorCampoTipoMemorias.text,
                          controladorCampoGeneracion.text,
                          controladorCampoVelocidadLectura.text,
                          controladorCampoVelocidadEscritura.text,
                          controladorCampoProtocolo.text,
                        );
                        try {
                          Laptop laptopNueva = await obtenerLaptopPorId(
                              widget.ssd.getIdRegistro());
                          laptopNueva.setProcesador(ssdActualizado.getModelo());
                          Ssd ssdRespuesta = await modificarSsd(
                              ssdActualizado, ssdActualizado.getIdRegistro());
                          if (ssdActualizado.getIdRegistro() ==
                              ssdRespuesta.getIdRegistro()) {
                            modificarLaptop(
                                laptopNueva, laptopNueva.getIdRegistro());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("ssd actualizado correctamente"),
                                content: Text("Se ha actualizado el ssd"
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
                              title: Text("ssd no actualizado"),
                              content: Text(
                                  "ocurrio un error y no se pudo actualizar\n"
                                  "el ssd por favor vuelva a intentar"),
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
                      } else if (!marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("marca de ssd no valida"),
                            content: Text("la marca del ssd no es valida\n"
                                "corrigala, asegurate de solo usar letras\n"
                                "sin numeros enteros ni espacios o guiones o ND\n"
                                "si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          !modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("modelo de ssd no valida"),
                            content: Text("el modelo del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar letras\n"
                                "numeros enteros y espacios o guiones o ND\n"
                                "si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          !capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Capacidad de ssd no valida"),
                            content: Text("La capacidad del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar numeros\n"
                                " enteros o 0 si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          !formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Factor de forma de ssd no valida"),
                            content: Text(
                                "El factor de forma del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar numeros\n"
                                " enteros o letras o ND si no conoce esta\n"
                                "informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          !durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Durabilidad de ssd no valida"),
                            content: Text(
                                "La durabilidad del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar numeros\n"
                                " enteros y especifica si son GB o Tb o ND\n"
                                "si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          !tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Tipo de memoria de ssd no valida"),
                            content:
                                Text("El tipo de memoria del ssd no es valido\n"
                                    "corrigalo, asegurate de solo usar letras\n"
                                    " para especificar de que tipo son, o ND\n"
                                    "si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          !tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Tipo de memoria de ssd no valida"),
                            content:
                                Text("El tipo de memoria del ssd no es valido\n"
                                    "corrigalo, asegurate de solo usar letras\n"
                                    " para especificar de que tipo son, o ND\n"
                                    "si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          !generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:
                                Text("Generacion de memoria de ssd no valida"),
                            content: Text(
                                "La generacionde memorias del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar letras\n"
                                " para especificar la generacion, o ND\n"
                                "si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          !velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:
                                Text("Velocidad de lectura de ssd no valida"),
                            content: Text(
                                "La velocidad de lectura del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar numeros\n"
                                " para especificar la velocidad y agregar Mb/s\n"
                                "al final para especificar la unidad de medida\n"
                                "o escribe ND si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          !velocidadEscrituraValida &&
                          protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:
                                Text("Velocidad de escritura de ssd no valida"),
                            content: Text(
                                "La velocidad de escritura del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar numeros\n"
                                " para especificar la velocidad y agregar Mb/s\n"
                                "al final para especificar la unidad de medida\n"
                                "o escribe ND si no conoce esta informacion"),
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
                      } else if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          formaValida &&
                          durabilidadValida &&
                          tipoMemoriaValida &&
                          generacionValida &&
                          velocidadLecuturaValida &&
                          velocidadEscrituraValida &&
                          !protocoloValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Protocolo del ssd no valida"),
                            content: Text(
                                "El protocolo de transferencia del ssd no es valido\n"
                                "corrigalo, asegurate de solo usar numeros\n"
                                " para especificar la version y letras para el tipo\n"
                                "o escribe ND si no conoce esta informacion"),
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
