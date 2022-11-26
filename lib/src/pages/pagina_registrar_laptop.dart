import 'package:flutter/material.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_hdd.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_pantalla.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_procesador.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_ram.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_tarjeta_video.dart';
import 'package:web_laptops/src/pages/pagina_especificar_ssd.dart';

class PaginaRegistrarLaptop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaRegistrarLaptop();
}

class _PaginaRegistrarLaptop extends State<PaginaRegistrarLaptop> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Registrar nueva Laptop',
              style: estiloTituloTexto,
            ),
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(left: 30.0, top: 15.0, right: 15.0),
          ),
          Container(
            width: 580,
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
                          'Marca y modelo: ',
                          style: estiloTexto,
                        ),
                        margin: EdgeInsets.all(10)),
                    SizedBox(
                      width: 400,
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
                    Container(
                      width: 50,
                      height: 45,
                      child: IconButton(
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaginaEspecificarProcesador(),
                            ),
                          )
                        },
                        icon: Icon(Icons.create),
                        color: Colors.blue,
                      ),
                    ),
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
                      child: IconButton(
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaginaEspecificarRam(),
                            ),
                          )
                        },
                        icon: Icon(Icons.create),
                        color: Colors.blue,
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
                      child: IconButton(
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaginaEspecificarTarjetaVideo(),
                            ),
                          )
                        },
                        icon: Icon(Icons.create),
                        color: Colors.blue,
                      ),
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
                      child: IconButton(
                        onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaginaEspecificarPantalla(),
                            ),
                          )
                        },
                        icon: Icon(Icons.create),
                        color: Colors.blue,
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
                      child: IconButton(
                        onPressed: () => {
                          if (checkValue == true)
                            {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PaginaEspecificarSsd(),
                                ),
                              )
                            }
                          else
                            {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PaginaEspecificarHdd(),
                                ),
                              )
                            }
                        },
                        icon: Icon(Icons.create),
                        color: Colors.blue,
                      ),
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
                  //height: 30,
                  alignment: AlignmentDirectional.centerEnd,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'Registrar Laptop',
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
