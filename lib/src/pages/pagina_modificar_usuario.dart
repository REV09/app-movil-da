import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_usuario.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';
import 'package:web_laptops/src/services/servicios_rest_usuario.dart';

class PaginaModificarUsuario extends StatefulWidget {
  Usuario usuario;

  PaginaModificarUsuario(this.usuario);

  @override
  State<StatefulWidget> createState() =>
      _PaginaModificarUsuario((usuario.getAdministrador() == 1) ? true : false);
}

class _PaginaModificarUsuario extends State<PaginaModificarUsuario> {
  bool checkValue;

  _PaginaModificarUsuario(this.checkValue);

  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  TextEditingController controladorCampoNombre = TextEditingController();
  TextEditingController controladorCampoApellido = TextEditingController();
  TextEditingController controladorCampoNombreUsuario = TextEditingController();
  TextEditingController controladorCampoCorreoElectronico =
      TextEditingController();
  TextEditingController controladorCampoContrasena = TextEditingController();
  TextEditingController controladorCampoConfirmarContrasena =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    controladorCampoNombre.text = widget.usuario.getNombre();
    controladorCampoApellido.text = widget.usuario.getApellido();
    controladorCampoCorreoElectronico.text =
        widget.usuario.getCorreoElectronico();
    controladorCampoNombreUsuario.text = widget.usuario.getNombreUsuario();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Modificar usuario',
              style: estiloTituloTexto,
            ),
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(left: 30.0, top: 15.0),
          ),
          Container(
            width: 1000,
            height: 500,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text(
                          'Nombre: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoNombre,
                      ),
                    ),
                    Container(
                      width: 50,
                    ),
                    Container(
                        child: Text(
                          'Apellido: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoApellido,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text(
                          'Nombre de usuario: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoNombreUsuario,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text('Correo electronico: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                        readOnly: true,
                        controller: controladorCampoCorreoElectronico,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text('Contraseña: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoContrasena,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child:
                            Text('Confirmar contraseña: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: decoracionCamposTexto,
                        controller: controladorCampoConfirmarContrasena,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: checkValue,
                        onChanged: (bool? value) {
                          setState(() {
                            checkValue = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('Administrador', style: estiloTexto),
                    )
                  ],
                )
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
                      bool nombreValido = false;
                      if (validarCampoLetrasEspacios(
                              controladorCampoNombre.text) ||
                          validarCampoLetrasSinEspacios(
                              controladorCampoNombre.text)) {
                        nombreValido = true;
                      }
                      bool apellidoValido = false;
                      if (validarCampoLetrasEspacios(
                              controladorCampoApellido.text) ||
                          validarCampoLetrasSinEspacios(
                              controladorCampoApellido.text)) {
                        apellidoValido = true;
                      }
                      bool nombreUsuarioValido = false;
                      if (validarCampoAlfanumericoSinEspacios(
                              controladorCampoNombreUsuario.text) ||
                          validarCampoAlfanumericoEspacios(
                              controladorCampoNombreUsuario.text) ||
                          validarCampoAlfanumericoGuiones(
                              controladorCampoNombreUsuario.text)) {
                        nombreUsuarioValido = true;
                      }

                      bool correoValido = validarCorreoElectronico(
                          controladorCampoCorreoElectronico.text);

                      if (nombreValido &&
                          apellidoValido &&
                          nombreUsuarioValido &&
                          correoValido) {
                        Usuario usuarioActualizado = Usuario(
                          controladorCampoNombreUsuario.text,
                          controladorCampoNombre.text,
                          controladorCampoApellido.text,
                          controladorCampoCorreoElectronico.text,
                          controladorCampoContrasena.text,
                          otorgarPermisos(),
                        );
                        if (controladorCampoContrasena.text ==
                            controladorCampoConfirmarContrasena.text) {
                          late Usuario usuarioRespuesta;
                          try {
                            usuarioRespuesta = await modificarUsuario(
                                usuarioActualizado,
                                widget.usuario.getNombreUsuario());
                            if (usuarioRespuesta.getCorreoElectronico() ==
                                usuarioActualizado.getCorreoElectronico()) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title:
                                      Text("Usuario actualizado correctamente"),
                                  content: Text(
                                      "Se ha actualizado la cuenta correctamente"),
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
                                title: Text("Usuario no actualizado"),
                                content:
                                    Text("Ocurrio un error con el servidor\n"
                                        "y no se pudo actualizar el usuario"),
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
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Contraseñas diferentes"),
                              content: Text(
                                  "Las contraseñas ingresadas no coinciden"),
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
                      } else if (!nombreValido &&
                          apellidoValido &&
                          nombreUsuarioValido &&
                          correoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Nombre personal no valido"),
                            content: Text(
                                "El nombre ingresado no es valido por favor\n"
                                "corrigalo"),
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
                      } else if (nombreValido &&
                          !apellidoValido &&
                          nombreUsuarioValido &&
                          correoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Apellido personal no valido"),
                            content: Text(
                                "El apellido ingresado no es valido por favor\n"
                                "corrigalo"),
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
                      } else if (nombreValido &&
                          apellidoValido &&
                          !nombreUsuarioValido &&
                          correoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Nombre de usuario no valido"),
                            content: Text(
                                "El usuario ingresado no es valido por favor\n"
                                "corrigalo"),
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
                      } else if (nombreValido &&
                          apellidoValido &&
                          nombreUsuarioValido &&
                          !correoValido) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Correo electronico no valido"),
                            content: Text(
                                "El correo electronico no es valido por favor\n"
                                "corrigalo"),
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
                            title: Text("informacion invalido"),
                            content: Text(
                                "La informacion de registro no es valida \n"
                                "por favor corriga su informacion completa"),
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
                      'modificar usuario',
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

  int otorgarPermisos() {
    if (checkValue) {
      return 1;
    }
    return 0;
  }
}
