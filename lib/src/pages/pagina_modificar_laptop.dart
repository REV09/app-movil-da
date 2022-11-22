import 'package:flutter/material.dart';

class PaginaModificarLaptop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaModificarLaptop();
}

class _PaginaModificarLaptop extends State<PaginaModificarLaptop> {
  InputDecoration decoracionCamposTexto = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)));

  TextStyle estiloTexto = TextStyle(
      fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);
  TextStyle estiloTituloTexto =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  bool? checkValue = false;

  IconButton botonDetallar = IconButton(
    onPressed: () => {},
    icon: Icon(Icons.create),
    color: Colors.blue,
  );

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
                'Modificar Laptop',
                style: estiloTituloTexto,
              ),
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(left: 30.0, top: 15.0)),
          Container(
            width: 980,
            height: 70,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text(
                          'Marca: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                      ),
                    ),
                    Container(
                      child: SizedBox(width: 200),
                    ),
                    Container(
                        child: Text(
                          'Modelo: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(5)),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextField(decoration: decoracionCamposTexto),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 1100,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black))),
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
                          'Procesador: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(decoration: decoracionCamposTexto),
                    ),
                    Container(width: 50, height: 45, child: botonDetallar),
                    Container(
                      child: SizedBox(width: 50),
                    ),
                    Container(
                        child: Text(
                          'Ram: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 45,
                      child: botonDetallar,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Tarjeta de video: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(decoration: decoracionCamposTexto),
                    ),
                    Container(
                      width: 50,
                      height: 45,
                      child: botonDetallar,
                    ),
                    Container(
                      child: SizedBox(width: 50),
                    ),
                    Container(
                        child: Text(
                          'Pantalla: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 45,
                      child: botonDetallar,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        alignment: AlignmentDirectional.center,
                        child: Text('Almacenamiento: ', style: estiloTexto),
                        margin: EdgeInsets.all(15)),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: decoracionCamposTexto,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 45,
                      child: botonDetallar,
                    ),
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
                      child: Text('SSD', style: estiloTexto),
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
                      'Actualizar',
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
