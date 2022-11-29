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

Future<Ssd> agregarSsd(Ssd ssd) async {
  final respuesta = await http.post(
    Uri.parse('https://web-production-2d2f.up.railway.app/ssd'),
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonEncode(<String, String>{
      "idRegistro": ssd.getIdRegistro(),
      "marca": ssd.getMarca(),
      "modelo": ssd.getModelo(),
      "capacidad": ssd.getCapacidad().toString(),
      "factorForma": ssd.getFactorForma(),
      "durabilidad": ssd.getDurabilidad(),
      "tipoMemorias": ssd.getTipoMemorias(),
      "generacionMemorias": ssd.getGeneracionMemorias(),
      "velocidadLectura": ssd.getVelocidadLectura(),
      "velocidadEscritura": ssd.getVelocidadEscritura(),
      "protocolo": ssd.getProtocolo(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return Ssd.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception(
        'No se pudo crear la unidad de estado solido correctamente');
  }
}
