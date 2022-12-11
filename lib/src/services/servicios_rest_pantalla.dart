import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_pantalla.dart';
import 'package:web_laptops/src/services/url_api.dart';

Pantalla convertirPantalla(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Pantalla.fromJson(jsonConvertido);
}

Future<Pantalla> obtenerPantalla(String idRegistro) async {
  final respuesta = await http.get(Uri.parse('$urlApi/pantalla/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirPantalla(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

Future<Pantalla> agregarPantalla(Pantalla pantalla) async {
  final respuesta = await http.post(
    Uri.parse('$urlApi/pantalla'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": pantalla.getIdRegistro(),
      "modelo": pantalla.getModelo(),
      "resolucion": pantalla.getResolucion(),
      "calidad": pantalla.getCalidad(),
      "tipoPantalla": pantalla.getTipoPantalla(),
      "tamanio": pantalla.getTamanio(),
      "frecuenciaRefresco": pantalla.getFrecuenciaRefresco().toString(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Pantalla.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear la pantalla correctamente');
  }
}

Future<Pantalla> modificarPantalla(Pantalla pantalla, String idRegistro) async {
  final respuesta = await http.put(
    Uri.parse('$urlApi/pantalla/{id_registro}?pantalla_id=$idRegistro'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": pantalla.getIdRegistro(),
      "modelo": pantalla.getModelo(),
      "resolucion": pantalla.getResolucion(),
      "calidad": pantalla.getCalidad(),
      "tipoPantalla": pantalla.getTipoPantalla(),
      "tamanio": pantalla.getTamanio(),
      "frecuenciaRefresco": pantalla.getFrecuenciaRefresco().toString(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Pantalla.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear la pantalla correctamente');
  }
}

Future<int> eliminarPantalla(String idRegistro) async {
  final respuesta =
      await http.delete(Uri.parse('$urlApi/pantalla/$idRegistro'));
  if (respuesta.statusCode == 204) {
    return 204;
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

void main(List<String> args) async {
  Pantalla pantalla = await obtenerPantalla('ABCDEF123456');
  print(pantalla);
}
