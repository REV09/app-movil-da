import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_usuario.dart';
import 'package:web_laptops/src/services/url_api.dart';

Usuario convertirUsuario(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Usuario.fromJson(jsonConvertido);
}

Future<Usuario> obtenerUsuario(String nombreUsuario) async {
  final respuesta = await http.get(Uri.parse('$urlApi/usuario/$nombreUsuario'));
  if (respuesta.statusCode == 200) {
    return convertirUsuario(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

Future<Usuario> agregarUsuario(Usuario usuario) async {
  final respuesta = await http.post(
    Uri.parse('$urlApi/usuario'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "nombreUsuario": usuario.getNombreUsuario(),
      "nombre": usuario.getNombre(),
      "apellido": usuario.getApellido(),
      "correoElectronico": usuario.getCorreoElectronico(),
      "contrasena": usuario.getContrasena(),
      "administrador": usuario.getAdministrador().toString(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Usuario.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear el usuario correctamente');
  }
}

Future<Usuario> modificarUsuario(Usuario usuario, String nombreAnterior) async {
  final respuesta = await http.put(
    Uri.parse(
        '$urlApi/usuario/{nombre_usuario}?nombre_usuario_anterior=$nombreAnterior'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "nombreUsuario": usuario.getNombreUsuario(),
      "nombre": usuario.getNombre(),
      "apellido": usuario.getApellido(),
      "correoElectronico": usuario.getCorreoElectronico(),
      "contrasena": usuario.getContrasena(),
      "administrador": usuario.getAdministrador().toString(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Usuario.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear el usuario correctamente');
  }
}

Future<int> eliminarUsuario(String nombreUsuario) async {
  final respuesta =
      await http.delete(Uri.parse('$urlApi/usuario/$nombreUsuario'));
  if (respuesta.statusCode == 204) {
    return 204;
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}
