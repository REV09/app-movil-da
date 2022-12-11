import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_memoria_ram.dart';
import 'package:web_laptops/src/services/url_api.dart';

MemoriaRam convertirMemoriaRam(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return MemoriaRam.fromJson(jsonConvertido);
}

Future<MemoriaRam> obtenerMemoriaRam(String idRegistro) async {
  final respuesta = await http.get(Uri.parse('$urlApi/memoria/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirMemoriaRam(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

Future<MemoriaRam> agregarMemoriaRam(MemoriaRam memoriaRam) async {
  final respuesta = await http.post(
    Uri.parse('$urlApi/memoria'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": memoriaRam.getIdRegistro(),
      "modelo": memoriaRam.getModelo(),
      "marca": memoriaRam.getMarca(),
      "tipoMemoria": memoriaRam.getTipoMemoria(),
      "cantidadMemoria": memoriaRam.getCantidadMemoria().toString(),
      "cantidadMemorias": memoriaRam.getCantidadMemorias().toString(),
      "velocidad": memoriaRam.getVelocidad().toString(),
      "ecc": memoriaRam.getEcc().toString(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return MemoriaRam.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear la memoria ram correctamente');
  }
}

Future<MemoriaRam> modificarMemoriaRam(
    MemoriaRam memoriaRam, String idRegistro) async {
  final respuesta = await http.put(
    Uri.parse('$urlApi/memoria/{id_registro}'
        '?ram_id=$idRegistro'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": memoriaRam.getIdRegistro(),
      "modelo": memoriaRam.getModelo(),
      "marca": memoriaRam.getMarca(),
      "tipoMemoria": memoriaRam.getTipoMemoria(),
      "cantidadMemoria": memoriaRam.getCantidadMemoria().toString(),
      "cantidadMemorias": memoriaRam.getCantidadMemorias().toString(),
      "velocidad": memoriaRam.getVelocidad().toString(),
      "ecc": memoriaRam.getEcc().toString(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return MemoriaRam.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear la memoria ram correctamente');
  }
}

Future<int> eliminarMemoriaRam(String idRegistro) async {
  final respuesta = await http.delete(Uri.parse('$urlApi/memoria/$idRegistro'));
  if (respuesta.statusCode == 204) {
    return 204;
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

void main(List<String> args) async {
  MemoriaRam memoriaRam =
      await obtenerMemoriaRam('91096249-080b-4d28-8a3f-7a7e1f46a115');

  print(memoriaRam);
}
