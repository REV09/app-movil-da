import 'package:flutter/material.dart';

class PaginaRegistrarUsuario extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaRegistrarUsuario();
}

class _PaginaRegistrarUsuario extends State<PaginaRegistrarUsuario> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  bool? checkValue = false;

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
              child: Text(
                'Registrar Nuevo usuario',
                style: estiloTituloTexto,
              ),
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.only(left: 30.0, top: 15.0)),
          Container(
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
                      ),
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
                      child: TextField(decoration: decoracionCamposTexto),
                    ),
                  ],
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
                      child: TextField(decoration: decoracionCamposTexto),
                    )
                  ],
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
                      child: TextField(decoration: decoracionCamposTexto),
                    )
                  ],
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
                      ),
                    )
                  ],
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
                      ),
                    )
                  ],
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
                    onPressed: () => {},
                    child: Text('Cancelar', style: estiloTexto),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, minimumSize: Size(40, 50)),
                  ),
                ),
                Expanded(child: SizedBox(width: 7)),
                Expanded(child: SizedBox(width: 7)),
                Container(
                  margin: EdgeInsets.all(25),
                  //height: 30,
                  alignment: AlignmentDirectional.centerEnd,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'Registrar usuario',
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
