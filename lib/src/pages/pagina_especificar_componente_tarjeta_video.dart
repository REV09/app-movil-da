import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/classes/clase_tarjeta_video.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_tarjeta_video.dart';

class PaginaEspecificarTarjetaVideo extends StatefulWidget {
  TarjetaVideo tarjetaVideo;

  PaginaEspecificarTarjetaVideo(this.tarjetaVideo);

  @override
  State<StatefulWidget> createState() => _PaginaEspecificarTarjetaVideo();
}

class _PaginaEspecificarTarjetaVideo
    extends State<PaginaEspecificarTarjetaVideo> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  TextEditingController controladorCampoMarca = TextEditingController();
  TextEditingController controladorCampoModelo = TextEditingController();
  TextEditingController controladorCampoCantidadVram = TextEditingController();
  TextEditingController controladorCampoTipoMemoria = TextEditingController();
  TextEditingController controladorCampoBits = TextEditingController();
  TextEditingController controladorCampoVelocidad = TextEditingController();
  TextEditingController controladorCampoTipo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoMarca.text = widget.tarjetaVideo.getMarca();
    controladorCampoModelo.text = widget.tarjetaVideo.getModelo();
    controladorCampoCantidadVram.text =
        widget.tarjetaVideo.getCantidadVram().toString();
    controladorCampoTipoMemoria.text = widget.tarjetaVideo.getTipoMemoria();
    controladorCampoBits.text = widget.tarjetaVideo.getBits().toString();
    controladorCampoVelocidad.text =
        widget.tarjetaVideo.getVelocidadReloj().toString();
    controladorCampoTipo.text = widget.tarjetaVideo.getTipo();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(
                'Especificar componente: Tarjeta de video',
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
                        child: Text('Cantidad de Vram: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoCantidadVram,
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
                        child: Text('Tipo de memoria: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoTipoMemoria,
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
                        child: Text('Bits de trabajo: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoBits,
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
                        child: Text('Velocidad de reloj (mhz): ',
                            style: estiloTexto),
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
                        child: Text('Tipo de grafica: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoTipo,
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
                                title: Text("Cancelar operacion"),
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
                      if (validarCampoAlfanumericoGuiones(
                              controladorCampoModelo.text) ||
                          validarCampoAlfanumericoEspacios(
                              controladorCampoModelo.text)) {
                        modeloValido = true;
                      }
                      bool marcaValida = false;
                      if (validarCampoAlfanumericoGuiones(
                              controladorCampoMarca.text) ||
                          validarCampoAlfanumericoEspacios(
                              controladorCampoMarca.text)) {
                        marcaValida = true;
                      }
                      bool vramValida = false;
                      if (validarCampoNumeroEntero(
                          controladorCampoCantidadVram.text)) {
                        vramValida = true;
                      }
                      bool tipoMemoriaValida = false;
                      if (validarCampoAlfanumericoSinEspacios(
                          controladorCampoTipoMemoria.text)) {
                        tipoMemoriaValida = true;
                      }
                      bool bitsValidos = false;
                      if (validarCampoNumeroEntero(controladorCampoBits.text)) {
                        bitsValidos = true;
                      }
                      bool velocidadValida = false;
                      if (validarCampoNumeroDecimal(
                          controladorCampoVelocidad.text)) {
                        velocidadValida = true;
                      }
                      if (modeloValido &&
                          marcaValida &&
                          vramValida &&
                          tipoMemoriaValida &&
                          bitsValidos &&
                          velocidadValida) {
                        TarjetaVideo tarjetaVideoActualizada = TarjetaVideo(
                          widget.tarjetaVideo.getIdRegistro(),
                          controladorCampoModelo.text,
                          controladorCampoMarca.text,
                          int.parse(controladorCampoCantidadVram.text),
                          controladorCampoTipoMemoria.text,
                          int.parse(controladorCampoBits.text),
                          double.parse(controladorCampoVelocidad.text),
                          controladorCampoTipo.text,
                        );
                        try {
                          Laptop laptopNueva = await obtenerLaptopPorId(
                              widget.tarjetaVideo.getIdRegistro());
                          laptopNueva.setTarjetaVideo(
                              " ${tarjetaVideoActualizada.getModelo()}");
                          TarjetaVideo tarjetaVideoRespuesta =
                              await modificarTarjetaVideo(
                                  tarjetaVideoActualizada,
                                  tarjetaVideoActualizada.getIdRegistro());
                          if (tarjetaVideoActualizada.getIdRegistro() ==
                              tarjetaVideoRespuesta.getIdRegistro()) {
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
                              title: Text("Tarjeta de video no actualizada"),
                              content: Text(
                                  "ocurrio un error y no se pudo actualizar\n"
                                  "la tarjeta de video por favor vuelva a "
                                  "intentar"),
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
                          vramValida &&
                          tipoMemoriaValida &&
                          bitsValidos &&
                          velocidadValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Modelo de tarjeta no valido"),
                            content: Text("El modelo ingresado no es valido\n"
                                "corrigalo, asegurese de no combinar guiones y\n"
                                "espacios solo use 1 de dos"),
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
                          vramValida &&
                          tipoMemoriaValida &&
                          bitsValidos &&
                          velocidadValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Marca de tarjeta no valido"),
                            content: Text("La marca ingresada no es valido\n"
                                "corrigalo, asegurate de no usar espacios,\n"
                                "guiones o algun caracter especial"),
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
                          !vramValida &&
                          tipoMemoriaValida &&
                          bitsValidos &&
                          velocidadValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("cantidad de memoria no valida"),
                            content: Text("La cantidad ingresada no es valida\n"
                                "asegurate de ingresar solo valores numericos\n"
                                "enteros"),
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
                          vramValida &&
                          !tipoMemoriaValida &&
                          bitsValidos &&
                          velocidadValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("tipo de memoria no valido"),
                            content: Text("El tipo de memoria no es valido\n"
                                "corrigalo, recuerda no usar espacios guiones\n"
                                "o algun caracterespecial"),
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
                          vramValida &&
                          tipoMemoriaValida &&
                          !bitsValidos &&
                          velocidadValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("bits de memoria no valido"),
                            content: Text("los bits de memoria no son validos\n"
                                "corrigalo, asegurate de solo usar numeros\n"
                                "enteros positivos o en su defecto 0 si no\n"
                                "conoce esta informacion"),
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
                          vramValida &&
                          tipoMemoriaValida &&
                          bitsValidos &&
                          !velocidadValida) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("velocidad de memoria no valida"),
                            content: Text(
                                "la velocidad de memoria no es valida\n"
                                "corrigala, asegurate de solo usar numeros\n"
                                "enteros o numeros decimales o en su defecto 0.0\n"
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
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Informacion de registro invalida"),
                            content: Text(
                                "Se detectaron uno o mas campos invalidos\n"
                                "por favor corriga la informacion"),
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
