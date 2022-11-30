import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_tarjeta_video.dart';

TarjetaVideo convertirTarjetaVideo(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return TarjetaVideo.fromJson(jsonConvertido);
}

Future<TarjetaVideo> obtenerTarjetaVideo(String idRegistro) async {
  final respuesta = await http.get(Uri.parse(
      'https://web-production-2d2f.up.railway.app/tarjetaDeVideo/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirTarjetaVideo(respuesta.body);
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

Future<TarjetaVideo> agregarTarjetaVideo(TarjetaVideo tarjetaVideo) async {
  final respuesta = await http.post(
    Uri.parse('https://web-production-2d2f.up.railway.app/tarjetaDeVideo'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": tarjetaVideo.getIdRegistro(),
      "modelo": tarjetaVideo.getModelo(),
      "marca": tarjetaVideo.getMarca(),
      "cantidadVram": tarjetaVideo.getCantidadVram().toString(),
      "tipoMemoria": tarjetaVideo.getTipoMemoria(),
      "bits": tarjetaVideo.getBits().toString(),
      "velocidadReloj": tarjetaVideo.getVelocidadReloj().toString(),
      "tipo": tarjetaVideo.getTipo(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return TarjetaVideo.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear la tarjeta de video correctamente');
  }
}

Future<TarjetaVideo> modificarTarjetaVideo(
    TarjetaVideo tarjetaVideo, String idRegistro) async {
  final respuesta = await http.put(
    Uri.parse(
        'https://web-production-2d2f.up.railway.app/tarjetaDeVideo/$idRegistro'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": tarjetaVideo.getIdRegistro(),
      "modelo": tarjetaVideo.getModelo(),
      "marca": tarjetaVideo.getMarca(),
      "cantidadVram": tarjetaVideo.getCantidadVram().toString(),
      "tipoMemoria": tarjetaVideo.getTipoMemoria(),
      "bits": tarjetaVideo.getBits().toString(),
      "velocidadReloj": tarjetaVideo.getVelocidadReloj().toString(),
      "tipo": tarjetaVideo.getTipo(),
    }),
  );
  if (respuesta.statusCode == 200) {
    return TarjetaVideo.fromJson(jsonDecode(respuesta.body));
  } else {
    throw Exception('No se pudo crear la tarjeta de video correctamente');
  }
}

Future<int> eliminarTarjetaVideo(String idRegistro) async {
  final respuesta = await http.delete(Uri.parse(
      'https://web-production-2d2f.up.railway.app/tarjetaDeVideo/$idRegistro'));
  if (respuesta.statusCode == 204) {
    return 204;
  } else {
    throw Exception('No fue posible recuperar la informacion');
  }
}

void main(List<String> args) async {
  TarjetaVideo tarjetaVideo = await obtenerTarjetaVideo('ABCDEF123456');
  print(tarjetaVideo);
}
