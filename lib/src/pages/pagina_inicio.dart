import 'package:flutter/material.dart';

class PaginaInicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaInicio();
}

class _PaginaInicio extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP flutter Android mobile'),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade800,
      ),
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            width: 50,
            height: 30,
            padding: const EdgeInsets.all(10),
            child: const Text("Inicio"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Lenovo Thinkpad T420?',
                  labelText: 'Busqueda especifica',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Buscar"),
                onPressed: () => {},
              ))
        ],
      ),
    );
  }
}
