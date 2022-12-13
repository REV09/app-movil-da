import 'package:flutter/material.dart';
import 'package:web_laptops/src/classes/clase_laptop.dart';
import 'package:web_laptops/src/pages/pagina_detalles_laptop_sesion_no_iniciada.dart';
import 'package:web_laptops/src/pages/pagina_iniciar_sesion.dart';
import 'package:web_laptops/src/pages/pagina_registrar_usuario.dart';
import 'package:web_laptops/src/services/servicios_rest_laptop.dart';
import 'package:web_laptops/src/logic/validaciones_de_texto.dart';

class PaginaInicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaInicio();
}

class _PaginaInicio extends State<PaginaInicio> {
  static List<Laptop> laptopsObtenidas = [];

  Laptop detallesLaptop = Laptop.laptopVacia();

  BorderSide colorBordes = BorderSide(color: Colors.black);
  int selectedIndex = -1;
  Color colorSeleccion = Colors.tealAccent.shade200;
  static int numItems = 1000;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  TextStyle estiloTexto = TextStyle(
      fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold);

  TextStyle estiloEncabezadoTabla =
      TextStyle(fontSize: 20, color: Colors.white);

  TextEditingController controladorCampoBuscar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        controller: controladorCampoBuscar,
                      ),
                    ),
                    Container(
                      child: SizedBox(width: 50),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!validarCampoAlfanumericoGuiones(
                                  controladorCampoBuscar.text) ||
                              !validarCampoAlfanumericoEspacios(
                                  controladorCampoBuscar.text)) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("informacion no valida"),
                                content: Text(
                                    "Ingresaste informacion no valida\n"
                                    "intenta con informacion valida nuevamente"),
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
                            String idRegistro = controladorCampoBuscar.text;
                            laptopsObtenidas.clear();
                            try {
                              laptopsObtenidas
                                  .add(await obtenerLaptopPorId(idRegistro));
                              print(laptopsObtenidas[0]);
                            } catch (excepcion) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("laptop no encontrada"),
                                  content: Text(
                                      "No se encontro la laptop solicitada\n"
                                      "verifique que el id de registro este\n"
                                      "escrito correctamente o pruebe buscar\n"
                                      " por modelo de laptop"),
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
                          }
                        },
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
                        onPressed: () async {
                          if (!validarCampoAlfanumericoGuiones(
                                  controladorCampoBuscar.text) ||
                              !validarCampoAlfanumericoEspacios(
                                  controladorCampoBuscar.text)) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("informacion no valida"),
                                content: Text(
                                    "Ingresaste informacion no valida\n"
                                    "intenta con informacion valida nuevamente"),
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
                            String modelo = controladorCampoBuscar.text;
                            laptopsObtenidas.clear();
                            try {
                              laptopsObtenidas
                                  .addAll(await obtenerLaptopPorModelo(modelo));
                              print(laptopsObtenidas);
                            } catch (excepcion) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("modelo no encontrado"),
                                  content: Text(
                                      "No se encontro el modelo solicitada\n"
                                      "verifique que se encuentre escrito\n"
                                      "correctamente o pruebe buscar\n"
                                      " por id de registro"),
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
                          }
                        },
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
                      width: 250,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: FutureBuilder(
                          future: obtenerLaptops(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("Ha ocurrido un error"
                                    " al conectar al servidor intentelo mas tarde"),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              int? numeroElementos = snapshot.data?.length;
                              numItems = numeroElementos!;
                              return DataTable(
                                showCheckboxColumn: false,
                                headingRowColor:
                                    MaterialStatePropertyAll(Colors.black),
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "Laptop",
                                      style: estiloEncabezadoTabla,
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  numeroElementos,
                                  (index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Text('${snapshot.data?[index].modelo}'),
                                      ),
                                    ],
                                    selected: selectedIndex == index,
                                    onSelectChanged: (bool? value) {
                                      setState(() {
                                        selectedIndex = index;
                                        selected[index] = value!;
                                        detallesLaptop.setIdRegistro(snapshot
                                            .data![index]
                                            .getIdRegistro());
                                        detallesLaptop.setAlmacenamiento(
                                            snapshot.data![index]
                                                .getAlmacenamiento());
                                        detallesLaptop.setMemoriaRam(snapshot
                                            .data![index]
                                            .getMemoriaRam());
                                        detallesLaptop.setModelo(
                                            snapshot.data![index].getModelo());
                                        detallesLaptop.setPantalla(snapshot
                                            .data![index]
                                            .getPantalla());
                                        detallesLaptop.setProcesador(snapshot
                                            .data![index]
                                            .getProcesador());
                                        detallesLaptop.setTarjetaVideo(snapshot
                                            .data![index]
                                            .getTarjetaVideo());
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
                            margin: EdgeInsets.all(20),
                            child: Text(
                              detallesLaptop.toString(),
                              style: estiloTexto,
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              child: Text("Ver detalles de laptop"),
                              onPressed: () async {
                                if (detallesLaptop.getIdRegistro() == "ND") {
                                  await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                "No hay laptop seleccionada"),
                                            content: Text(
                                                "No se pueden mostrar detalles"
                                                "\nsino seleccionas una laptop"),
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
                                } else {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PaginaDetallesLaptopSesionNoIniciada(
                                              detallesLaptop),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(5),
                                  backgroundColor: Colors.lightBlue.shade900),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minWidth: 300,
                              minHeight: 100,
                            ),
                            margin: EdgeInsets.all(5),
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
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaginaRegistrarUsuario(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(5),
                                  backgroundColor: Colors.lightBlue.shade900),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minWidth: 300,
                              minHeight: 100,
                            ),
                            margin: EdgeInsets.all(5),
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
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PaginaIniciarSesion(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
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
}
