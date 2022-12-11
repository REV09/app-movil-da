import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_almacenamiento.dart';
import 'package:web_laptops/src/services/url_api.dart';

Almacenamiento convertirAlmacenamiento(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Almacenamiento.fromJson(jsonConvertido);
}

Future<Almacenamiento> obtenerAlmacenamiento(String idRegistro) async {
  final respuesta =
      await http.get(Uri.parse('$urlApi/almacenamiento/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirAlmacenamiento(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

Future<Almacenamiento> agregarAlmacenamiento(
    Almacenamiento almacenamiento) async {
  final respuesta = await http.post(
    Uri.parse('$urlApi/almacenamiento'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": almacenamiento.getIdRegistro(),
      "tipoAlmacenamiento": almacenamiento.getTipoAlmacenamiento(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Almacenamiento.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception("No se pudo crear el almacenamiento correctamente");
  }
}

Future<Almacenamiento> modificarAlmacenamiento(
    Almacenamiento almacenamiento, String idRegistro) async {
  final respuesta = await http.put(
    Uri.parse(
        '$urlApi/almacenamiento/{id_registro}?almacenamiento_id=$idRegistro'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegisro": almacenamiento.getIdRegistro(),
      "tipoAlmacenamiento": almacenamiento.getTipoAlmacenamiento(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Almacenamiento.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception("No se pudo crear el almacenamiento correctamente");
  }
}

Future<int> eliminarAlmacenamiento(String idRegistro) async {
  final respuesta =
      await http.delete(Uri.parse('$urlApi/almacenamiento/$idRegistro'));
  if (respuesta.statusCode == 204) {
    return 204;
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

void main(List<String> args) async {
  Almacenamiento almacenamientoPrueba = Almacenamiento("idRegistro", "HDD");
  Almacenamiento almacenamiento =
      await agregarAlmacenamiento(almacenamientoPrueba);
  print(
      "${almacenamiento.getIdRegistro()}\n${almacenamiento.getTipoAlmacenamiento()}");
}
