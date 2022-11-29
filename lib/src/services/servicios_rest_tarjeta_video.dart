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

void main(List<String> args) async {
  TarjetaVideo tarjetaVideo = await obtenerTarjetaVideo('ABCDEF123456');
  print(tarjetaVideo);
}
