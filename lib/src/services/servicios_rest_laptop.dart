import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_laptop.dart';

List<Laptop> convertirLaptops(String cuerpoRespuesta) {
  var convertido = json.decode(cuerpoRespuesta).cast<Map<String, dynamic>>();
  return convertido.map<Laptop>((json) => Laptop.fromJson(json)).toList();
}

Future<List<Laptop>> obtenerLaptops() async {
  final respuesta = await http
      .get(Uri.parse('https://fastapi-laptops.herokuapp.com/laptops'));
  if (respuesta.statusCode == 200) {
    return convertirLaptops(respuesta.body);
  }
  throw Exception('No fue posible recuperar la informacion');
}
