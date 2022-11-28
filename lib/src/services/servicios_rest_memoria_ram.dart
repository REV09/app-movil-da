import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_memoria_ram.dart';

MemoriaRam convertirMemoriaRam(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return MemoriaRam.fromJson(jsonConvertido);
}

Future<MemoriaRam> obtenerMemoriaRam(String idRegistro) async {
  final respuesta = await http.get(
      Uri.parse('https://fastapi-laptops.herokuapp.com/memoria/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirMemoriaRam(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

void main(List<String> args) async {
  MemoriaRam memoriaRam =
      await obtenerMemoriaRam('91096249-080b-4d28-8a3f-7a7e1f46a115');

  print(memoriaRam);
}
