import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_hdd.dart';

Hdd convertirHdd(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Hdd.fromJson(jsonConvertido);
}

Future<Hdd> obtenerHdd(String idRegistro) async {
  final respuesta = await http.get(
      Uri.parse('https://web-production-2d2f.up.railway.app/hdd/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirHdd(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

Future<Hdd> agregarHdd(Hdd hdd) async {
  final respuesta = await http.post(
    Uri.parse('https://web-production-2d2f.up.railway.app/hdd'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": hdd.getIdRegistro(),
      "marca": hdd.getMarca(),
      "modelo": hdd.getModelo(),
      "capacidad": hdd.getCapacidad().toString(),
      "interfaz": hdd.getInterfaz(),
      "cache": hdd.getCache().toString(),
      "revoluciones": hdd.getRevoluciones().toString(),
      "tamanio": hdd.getTamanio(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Hdd.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception("No se pudo crear el disco duro correctamente");
  }
}

Future<Hdd> modificarHdd(Hdd hdd, String idRegistro) async {
  final respuesta = await http.put(
    Uri.parse(
        'https://web-production-2d2f.up.railway.app/hdd/{id_registro}?hdd_id=$idRegistro'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": hdd.getIdRegistro(),
      "marca": hdd.getMarca(),
      "modelo": hdd.getModelo(),
      "capacidad": hdd.getCapacidad().toString(),
      "interfaz": hdd.getInterfaz(),
      "cache": hdd.getCache().toString(),
      "revoluciones": hdd.getRevoluciones().toString(),
      "tamanio": hdd.getTamanio(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Hdd.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception("No se pudo crear el disco duro correctamente");
  }
}

Future<int> eliminarHdd(String idRegistro) async {
  final respuesta = await http.delete(
      Uri.parse('https://web-production-2d2f.up.railway.app/hdd/$idRegistro'));
  if (respuesta.statusCode == 204) {
    return 204;
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}
