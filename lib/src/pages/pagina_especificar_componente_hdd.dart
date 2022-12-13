import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_hdd.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';
import 'package:web_laptops/src/services/servicios_rest_hdd.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';

class PaginaEspecificarHdd extends StatefulWidget {
  Hdd discoDuro;

  PaginaEspecificarHdd(this.discoDuro);

  @override
  State<StatefulWidget> createState() => _PaginaEspecificarHdd();
}

class _PaginaEspecificarHdd extends State<PaginaEspecificarHdd> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  TextEditingController controladorCampoMarca = TextEditingController();
  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoCapacidad = TextEditingController();
  TextEditingController controladorCampoInterfaz = TextEditingController();
  TextEditingController controladorCampoCache = TextEditingController();
  TextEditingController controladorCampoRevoluciones = TextEditingController();
  TextEditingController controladorCampoTamanio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoMarca.text = widget.discoDuro.getMarca();
    controladorCampoModelo.text = widget.discoDuro.getModelo();
    controladorCampoCapacidad.text = widget.discoDuro.getCapacidad().toString();
    controladorCampoInterfaz.text = widget.discoDuro.getInterfaz();
    controladorCampoCache.text = widget.discoDuro.getCache().toString();
    controladorCampoRevoluciones.text =
        widget.discoDuro.getRevoluciones().toString();
    controladorCampoTamanio.text = widget.discoDuro.getTamanio();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(
                'Especificar componente: Almacenamiento(HDD)',
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
                        child: Text('Capacidad: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoCapacidad,
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
                        child: Text('Interfaz: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoInterfaz,
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
                        child: Text('Cache: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoCache,
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
                        child: Text('Revoluciones: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoRevoluciones,
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
                        child: Text('Tamaño del disco: ', style: estiloTexto),
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
                      bool marcaValida = validarCampoLetrasSinEspacios(
                          controladorCampoMarca.text);
                      bool modeloValido = false;
                      if (validarCampoAlfanumericoEspacios(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoGuiones(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoSinEspacios(
                              controladorCampoModelo.text)) {
                        modeloValido = true;
                      }
                      bool capacidadValida = validarCampoNumeroEntero(
                          controladorCampoCapacidad.text);
                      bool interfazValida = validarCampoAlfanumericoSinEspacios(
                          controladorCampoInterfaz.text);
                      bool cacheValida =
                          validarCampoNumeroEntero(controladorCampoCache.text);
                      bool revolucionesValidas = validarCampoNumeroEntero(
                          controladorCampoRevoluciones.text);
                      bool tamanioValido = validarCampoNumeroDecimal(
                          controladorCampoTamanio.text);

                      if (marcaValida &&
                          modeloValido &&
                          capacidadValida &&
                          interfazValida &&
                          cacheValida &&
                          revolucionesValidas &&
                          tamanioValido) {
                        Hdd discoDuroActualizado = Hdd(
                          widget.discoDuro.getIdRegistro(),
                          controladorCampoMarca.text,
                          controladorCampoModelo.text,
                          int.parse(controladorCampoCapacidad.text),
                          controladorCampoInterfaz.text,
                          int.parse(controladorCampoCache.text),
                          int.parse(controladorCampoRevoluciones.text),
                          controladorCampoTamanio.text,
                        );
                        try {
                          Laptop laptopNueva = await obtenerLaptopPorId(
                              widget.discoDuro.getIdRegistro());
                          laptopNueva.setAlmacenamiento(
                              discoDuroActualizado.getModelo());
                          Hdd hddRespuesta = await modificarHdd(
                              discoDuroActualizado,
                              discoDuroActualizado.getIdRegistro());
                          if (discoDuroActualizado.getIdRegistro() ==
                              hddRespuesta.getIdRegistro()) {
                            modificarLaptop(
                                laptopNueva, laptopNueva.getIdRegistro());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    "Disco duro actualizado correctamente"),
                                content: Text("Se ha actualizado el disco duro"
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
                              title: Text("disco duro no actualizado"),
                              content: Text(
                                  "ocurrio un error y no se pudo actualizar\n"
                                  "el disco duro por favor vuelva a intentar"),
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
                          interfazValida &&
                          cacheValida &&
                          revolucionesValidas &&
                          tamanioValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Marca de disco duro invalida"),
                            content: Text(
                                "La marca del disco duro ingresada es invalida\n"
                                "verfique, recuerde que solo debe escribir letras\n"
                                "y sin guiones o espacios sino conoce este\n"
                                "dato escriba ND"),
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
                          interfazValida &&
                          cacheValida &&
                          revolucionesValidas &&
                          tamanioValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Modelo de disco duro invalido"),
                            content: Text(
                                "El modelo del disco duro ingresada es invalida\n"
                                "verfique, recuerde que solo debe escribir letras\n"
                                "y numeros, no combine espacios y guiones, sino\n"
                                "conoce este dato escriba ND"),
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
                          interfazValida &&
                          cacheValida &&
                          revolucionesValidas &&
                          tamanioValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Capacidad de disco duro invalido"),
                            content: Text(
                                "La capacidad del disco duro ingresada es invalida\n"
                                "verfique, recuerde que solo debe escribir\n"
                                "numeros, no utilize espacios y guiones, sino\n"
                                "conoce este dato escriba 0"),
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
                          !interfazValida &&
                          cacheValida &&
                          revolucionesValidas &&
                          tamanioValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Interfaz de disco duro invalida"),
                            content: Text(
                                "La intefaz del disco duro ingresada es invalida\n"
                                "verfique, recuerde que solo debe escribir\n"
                                "letras, no utilize espacios y guiones, sino\n"
                                "conoce este dato escriba 0"),
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
                          interfazValida &&
                          !cacheValida &&
                          revolucionesValidas &&
                          tamanioValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Cache de disco duro invalida"),
                            content: Text(
                                "La cache del disco duro ingresada es invalida\n"
                                "verfique, recuerde que solo debe escribir\n"
                                "numeros, no utilize espacios y guiones, sino\n"
                                "conoce este dato escriba 0"),
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
                          interfazValida &&
                          cacheValida &&
                          !revolucionesValidas &&
                          tamanioValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Revoluciones de disco duro invalida"),
                            content: Text(
                                "Las RPM del disco duro ingresada es invalida\n"
                                "verfique, recuerde que solo debe escribir\n"
                                "numeros, no utilize espacios y guiones, sino\n"
                                "conoce este dato escriba 0"),
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
                          interfazValida &&
                          cacheValida &&
                          revolucionesValidas &&
                          !tamanioValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Tamaño de disco duro invalida"),
                            content: Text(
                                "El tamaño del disco duro ingresada es invalida\n"
                                "verfique, recuerde que solo debe escribir\n"
                                "numeros decimales, no utilize espacios y guiones\n"
                                "sino conoce este dato escriba 0"),
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
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Operacion invalida"),
                            content: Text(
                                "Se ha detectado uno o mas campos invalidos\n"
                                "por favor corriga la informacion para continuar"),
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
