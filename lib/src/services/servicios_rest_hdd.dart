import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_hdd.dart';

Hdd convertirHdd(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Hdd.fromJson(jsonConvertido);
}

Future<Hdd> obtenerHdd(String idRegistro) async {
  final respuesta = await http
      .get(Uri.parse('https://fastapi-laptops.herokuapp.com/hdd/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirHdd(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}
