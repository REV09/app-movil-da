import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';

class PaginaInicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaInicio();
}

class _PaginaInicio extends State<PaginaInicio> {
  Future<List<Laptop>> laptopsObtenidas = obtenerLaptops();

  BorderSide colorBordes = BorderSide(color: Colors.black);
  int selectedIndex = -1;
  Color colorSeleccion = Colors.tealAccent.shade200;
  static const int numItems = 2;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  TextStyle estiloTexto = TextStyle(
      fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);

  TextStyle estiloEncabezadoTabla =
      TextStyle(fontSize: 20, color: Colors.white);

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
            margin: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Inicio',
                        style: estiloTexto,
                      ),
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      width: 20,
                    ),
                    SizedBox(
                      width: 500,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: SizedBox(width: 50),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () => {},
                        child: Text(
                          'Buscar por Id',
                          style: estiloTexto,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(40, 50),
                        ),
                      ),
                    ),
                    Container(
                      child: SizedBox(width: 50),
                    ),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => {},
                        child: Text(
                          'Buscar por modelo',
                          style: estiloTexto,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(40, 50),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 400,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: FutureBuilder(
                          future: laptopsObtenidas,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.data);
                              return Center(
                                child: Text("Ha ocurrido un error"
                                    " al conectar al servidor intentelo mas tarde"),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              int? numeroElementos = snapshot.data?.length;
                              return DataTable(
                                showBottomBorder: false,
                                headingRowColor:
                                    MaterialStatePropertyAll(Colors.black),
                                columns: [
                                  DataColumn(label: Text("Marca")),
                                  DataColumn(
                                    label: Text("Modelo"),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  numeroElementos!,
                                  (index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('Marca}')),
                                      DataCell(
                                        Text('${snapshot.data?[index].modelo}'),
                                      ),
                                    ],
                                    selected: selectedIndex == index,
                                    onSelectChanged: (bool? value) {
                                      setState(() {
                                        selectedIndex = index;
                                        selected[index] = value!;
                                      });
                                    },
                                    color: MaterialStateColor.resolveWith(
                                      (states) {
                                        return index == selectedIndex
                                            ? Colors.blueGrey.shade400
                                            : Colors.white;
                                      },
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: colorBordes,
                                top: colorBordes,
                                right: colorBordes,
                                left: colorBordes,
                              ),
                            ),
                            margin: EdgeInsets.all(30),
                            child: Text(
                              mostrarDetallesLaptop(),
                              style: estiloTexto,
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minWidth: 300,
                              minHeight: 100,
                            ),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border(
                                top: colorBordes,
                                bottom: colorBordes,
                                right: colorBordes,
                                left: colorBordes,
                              ),
                            ),
                            child: ElevatedButton(
                              child: Text("Registrarse"),
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(30, 50),
                                  maximumSize: Size(50, 50),
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Colors.lightBlue.shade900),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minWidth: 300,
                              minHeight: 100,
                            ),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border(
                                top: colorBordes,
                                left: colorBordes,
                                right: colorBordes,
                                bottom: colorBordes,
                              ),
                            ),
                            child: ElevatedButton(
                              child: Text("Iniciar Sesion"),
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(30, 50),
                                maximumSize: Size(50, 50),
                                padding: EdgeInsets.all(20),
                                backgroundColor: Colors.teal.shade900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String mostrarDetallesLaptop() {
    Laptop laptop = Laptop.sinParametros();
    laptop.setIdRegistro("idRegistro");
    laptop.setModelo("modelo");
    laptop.setMemoriaRam("Memoria ram");
    laptop.setProcesador("procesador");
    laptop.setPantalla("pantalla");
    laptop.setTarjetaVideo("tarjeta de video");
    laptop.setAlmacenamiento("almacenamiento");
    return laptop.toString();
  }

  /*void obtenerRegistrosLaptops() {
    obtenerLaptops().then((value) {
      setState((() => laptopsObtenidas.addAll(value)));
    });
  }*/

  /*List<DataRow> agregarInformacion() {
    List<DataRow> listaFilas = [];
    for (int index = 0; index < laptopsObtenidas.length; index++) {
      DataRow fila = DataRow(
        cells: <DataCell>[
          DataCell(Text('Marca}')),
          DataCell(Text('${laptopsObtenidas[index].modelo}')),
        ],
        selected: selectedIndex == index,
        onSelectChanged: (bool? value) {
          setState(() {
            selectedIndex = index;
            selected[index] = value!;
          });
        },
        color: MaterialStateColor.resolveWith(
          (states) {
            return index == selectedIndex
                ? Colors.blueGrey.shade400
                : Colors.white;
          },
        ),
      );
      listaFilas.add(fila);
    }
    return listaFilas;
  }*/
}
