import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_pantalla.dart';

Pantalla convertirPantalla(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Pantalla.fromJson(jsonConvertido);
}

Future<Pantalla> obtenerPantalla(String idRegistro) async {
  final respuesta = await http.get(
      Uri.parse('https://fastapi-laptops.herokuapp.com/pantalla/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirPantalla(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

void main(List<String> args) async {
  Pantalla pantalla = await obtenerPantalla('ABCDEF123456');
  print(pantalla);
}
