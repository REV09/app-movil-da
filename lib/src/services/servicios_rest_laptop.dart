import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_laptops/src/classes/clase_laptop.dart';

List<Laptop> convertirLaptops(String cuerpoRespuesta) {
  var convertido = json.decode(cuerpoRespuesta).cast<Map<String, dynamic>>();
  return convertido.map<Laptop>((json) => Laptop.fromJson(json)).toList();
}

Laptop convertirLaptop(String cuerpoRespuesta) {
  Map<String, dynamic> jsonConvertido = json.decode(cuerpoRespuesta);
  return Laptop.fromJson(jsonConvertido);
}

Future<List<Laptop>> obtenerLaptops() async {
  final respuesta = await http
      .get(Uri.parse('https://web-production-2d2f.up.railway.app/laptops'));
  if (respuesta.statusCode == 200) {
    return convertirLaptops(respuesta.body);
  }
  throw Exception('No fue posible recuperar la informacion');
}

Future<Laptop> obtenerLaptopPorId(String idRegistro) async {
  final respuesta = await http.get(Uri.parse(
      'https://web-production-2d2f.up.railway.app/laptop/$idRegistro'));
  if (respuesta.statusCode == 200) {
    return convertirLaptop(respuesta.body);
  }
  throw Exception('No fue posible recuperar la informacion');
}

Future<List<Laptop>> obtenerLaptopPorModelo(String modelo) async {
  final respuesta = await http.get(
      Uri.parse('https://web-production-2d2f.up.railway.app/laptop/$modelo'));
  if (respuesta.statusCode == 200) {
    return convertirLaptops(respuesta.body);
  }
  throw Exception('No fue posible recuperar la informacion');
}

Future<Laptop> agregarLaptop(Laptop laptop) async {
  final respuesta = await http.post(
    Uri.parse('https://web-production-2d2f.up.railway.app/laptop'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      "idRegistro": "",
      "modelo": laptop.getModelo(),
      "memoriaRam": laptop.getMemoriaRam(),
      "tarjetaVideo": laptop.getTarjetaVideo(),
      "pantalla": laptop.getPantalla(),
      "almacenamiento": laptop.getAlmacenamiento(),
      "procesador": laptop.getProcesador()
    }),
  );
  if (respuesta.statusCode == 200) {
    return Laptop.fromJson(jsonDecode(respuesta.body));
  }
  throw Exception('No se pudo crear la laptop correctamente');
}

void main(List<String> args) async {
  Laptop pruebaLaptop = Laptop(
    "idRegistro",
    "modelo",
    "memoriaRam",
    "tarjetaVideo",
    "pantalla",
    "procesador",
    "almacenamiento",
  );
  Laptop laptop = await agregarLaptop(pruebaLaptop);
  print(laptop);
}
