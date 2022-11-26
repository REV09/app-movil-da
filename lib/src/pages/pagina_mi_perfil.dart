import 'package:flutter/material.dart';
import 'package:web_laptops/src/pages/pagina_modificar_usuario.dart';
import 'pagina_registrar_usuario.dart';

class PaginaMiPerfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaMiPerfil();
}

class _PaginaMiPerfil extends State<PaginaMiPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text('Mi Perfil'),
          alignment: AlignmentDirectional.centerStart,
          margin: EdgeInsets.all(20),
        ),
        Container(
          margin: EdgeInsets.all(10),
          alignment: AlignmentDirectional.center,
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 250),
          child: Text('Nombre: Hector David' +
              '\Nombre de usuario: cazaFurros' +
              '\nCorreo eletronico: correo@gmail.com' +
              '\nTipo de usuario: TipoUsuario'),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black))),
        ),
        Container(
          margin: EdgeInsets.all(10),
          alignment: AlignmentDirectional.center,
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 50),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                alignment: AlignmentDirectional.centerStart,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaginaModificarUsuario(),
                      ),
                    ),
                  },
                  child: Text('Editar perfil'),
                ),
              ),
              SizedBox(
                width: 120,
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: AlignmentDirectional.centerEnd,
                child: ElevatedButton(
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Eliminar cuenta"),
                              content:
                                  Text("¿Estas seguro de eliminar tu cuenta?\n"
                                      "\nEsta accion no se puede deshacer"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Aceptar"),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.red),
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
                  child: Text('Eliminar perfil'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () => {Navigator.of(context).pop()},
            child: Text('Cerrar'))
      ],
    ));
  }
}
