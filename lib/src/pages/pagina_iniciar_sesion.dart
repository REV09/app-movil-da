import 'package:flutter/material.dart';

class PaginaIniciarSesion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaIniciarSesion();
}

class _PaginaIniciarSesion extends State<PaginaIniciarSesion> {
  InputDecoration decoracionIniciarSesionCampoTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      hintText: 'Ej: email-address@email.com');

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre del sistema'),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade800,
      ),
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
              'Correo electronico',
              style: estiloTextoCuerpo,
            ),
          ),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: decoracionIniciarSesionCampoTexto,
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Contraseña',
              style: estiloTextoCuerpo,
            ),
          ),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: decoracionContrasenaCampoTexto,
              obscureText: true,
              obscuringCharacter: '*',
            ),
          ),
          Container(
            height: 40,
          ),
          Container(
            child: ElevatedButton(
              child: Text('Iniciar sesión'),
              onPressed: () => {},
              style: estiloBotonIniciarSesion,
            ),
            width: 200,
            height: 50,
          ),
          Container(
            height: 20,
          ),
          Container(
            child: ElevatedButton(
              child: Text('Cancelar'),
              onPressed: () => {
                Navigator.pop(context, false),
              },
              style: estiloBotonCancelar,
            ),
            width: 200,
            height: 50,
          ),
        ],
      ),
    );
  }
}
