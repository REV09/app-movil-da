import 'package:flutter/material.dart';
import 'pagina_registrar_usuario.dart';

class PaginaMiPerfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaMiPerfil();
}

class _PaginaMiPerfil extends State<PaginaMiPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('APP flutter Android mobile'),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade800,
        ),
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
                      onPressed: () => {},
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
                      onPressed: () => {},
                      child: Text('Eliminar perfil'),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: () => {}, child: Text('Cerrar'))
          ],
        ));
  }
}
