import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_almacenamiento.dart';

Almacenamiento convertirAlmacenamiento(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Almacenamiento.fromJson(jsonConvertido);
}

Future<Almacenamiento> obtenerAlmacenamiento(String idRegistro) async {
  final respuesta = await http.get(Uri.parse(
      'https://fastapi-laptops.herokuapp.com/almacenamiento/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirAlmacenamiento(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}
