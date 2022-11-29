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
/*
void main(List<String> args) async {
  Procesador procesador = await obtenerProcesador('ABCDEF123456');
  print(procesador);
}
*/