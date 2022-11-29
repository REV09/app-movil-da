import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_procesador.dart';

Procesador convertirProcesador(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta.toString());
  return Procesador.fromJson(jsonConvertido);
}

Future<Procesador> obtenerProcesador(String idRegistro) async {
  final respuesta = await http.get(Uri.parse(
      'https://web-production-2d2f.up.railway.app/procesador/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirProcesador(respuesta.body);
  }
  throw Exception('No fue posible recuperar la informacion');
}

Future<Procesador> agregarProcesador(Procesador procesador) async {
  final respuesta = await http.post(
    Uri.parse('https://web-production-2d2f.up.railway.app/procesador'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": procesador.getIdRegistro(),
      "modelo": procesador.getModelo(),
      "marca": procesador.getMarca(),
      "numeroNucleos": procesador.getNumeroNucleos().toString(),
      "numeroHilos": procesador.getNumeroHilos().toString(),
      "velocidadMaxima": procesador.getVelocidadMaxima().toString(),
      "velocidadMinima": procesador.getVelocidadMinima().toString(),
      "litografia": procesador.getLitografia().toString(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Procesador.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear el procesador correctamente');
  }
}
/*
void main(List<String> args) async {
  Procesador procesador = await obtenerProcesador('ABCDEF123456');
  print(procesador);
}
*/