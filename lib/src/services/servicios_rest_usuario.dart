import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_usuario.dart';

Usuario convertirUsuario(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Usuario.fromJson(jsonConvertido);
}

Future<Usuario> obtenerUsuario(String nombreUsuario) async {
  final respuesta = await http.get(Uri.parse(
      'https://fastapi-laptops.herokuapp.com/usuario/$nombreUsuario'));
  if (respuesta.statusCode == 200) {
    return convertirUsuario(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}
