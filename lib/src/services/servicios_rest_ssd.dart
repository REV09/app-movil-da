import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_ssd.dart';

Ssd convertirSsd(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Ssd.fromJson(jsonConvertido);
}

Future<Ssd> obtenerSsd(String idRegistro) async {
  final respuesta = await http.get(
      Uri.parse('https://web-production-2d2f.up.railway.app/ssd/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirSsd(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}
