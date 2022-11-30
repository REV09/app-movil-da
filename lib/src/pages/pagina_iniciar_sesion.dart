import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_usuario.dart';
import 'package:web_laptops/src/pages/pagina_inicio_sesion_iniciada.dart';
import 'package:web_laptops/src/services/servicios_rest_usuario.dart';

class PaginaIniciarSesion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaIniciarSesion();
}

class _PaginaIniciarSesion extends State<PaginaIniciarSesion> {
  InputDecoration decoracionIniciarSesionCampoTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      hintText: 'Ej: usuario12345');

  InputDecoration decoracionContrasenaCampoTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      hintText: '***************');

  ButtonStyle estiloBotonCancelar =
      ElevatedButton.styleFrom(backgroundColor: Colors.red);

  ButtonStyle estiloBotonIniciarSesion =
      ElevatedButton.styleFrom(backgroundColor: Colors.green.shade900);

  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  TextStyle estiloTextoCuerpo =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  TextEditingController controladorNombreUsuario = TextEditingController();

  TextEditingController _controladorContrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Inicio de sesión',
              style: estiloTituloTexto,
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Nombre de usuario: ',
              style: estiloTextoCuerpo,
            ),
          ),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: decoracionIniciarSesionCampoTexto,
              controller: controladorNombreUsuario,
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Contraseña: ',
              style: estiloTextoCuerpo,
            ),
          ),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: decoracionContrasenaCampoTexto,
              obscureText: true,
              obscuringCharacter: '*',
              controller: _controladorContrasena,
            ),
          ),
          Container(
            height: 40,
          ),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                late Usuario usuario;
                try {
                  usuario = await obtenerUsuario(controladorNombreUsuario.text);
                  if (usuario.getContrasena() == _controladorContrasena.text) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PaginaInicioSesionIniciada(usuario),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Contraseña incorrecta"),
                        content: Text("La contraseña no es correcta verifique"),
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
                } catch (excepcion) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Usuario no valido"),
                            content: Text(
                                "No existe cuenta registrada con ese nombre"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: Text("Aceptar"),
                              ),
                            ],
                          ),
                      barrierDismissible: false);
                }
              },
              style: estiloBotonIniciarSesion,
              child: Text('Iniciar sesión'),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.pop(context, false),
              },
              style: estiloBotonCancelar,
              child: Text('Cancelar'),
            ),
          ),
        ],
      ),
    );
  }
}
