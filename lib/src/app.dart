import 'package:flutter/material.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_hdd.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_pantalla.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_ram.dart';
import 'package:web_laptops/src/pages/pagina_especificar_componente_tarjeta_video.dart';
import 'package:web_laptops/src/pages/pagina_especificar_ssd.dart';
import 'package:web_laptops/src/pages/pagina_mi_perfil.dart';
import 'package:web_laptops/src/pages/pagina_registrar_laptop.dart';
import 'pages/pagina_inicio.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Center(child: PaginaInicio()),
    );
  }
}
