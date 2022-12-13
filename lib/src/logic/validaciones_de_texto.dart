bool validarCampoAlfanumericoEspacios(String textoValidar) {
  RegExp expresionAlfanumerica = RegExp(r'([A-Za-z0-9]+( [A-Za-z0-9]+)+)');
  return expresionAlfanumerica.hasMatch(textoValidar);
}

bool validarCampoAlfanumericoSinEspacios(String textoValidar) {
  RegExp expresionAlfanumerica = RegExp(r'[A-Za-z0-9]+');
  return expresionAlfanumerica.hasMatch(textoValidar);
}

bool validarCampoLetrasSinEspacios(String textoValidar) {
  RegExp expresionLetras = RegExp(r'[a-zA-Z]+');
  return expresionLetras.hasMatch(textoValidar);
}

bool validarCampoAlfanumericoGuiones(String textoValidar) {
  RegExp expresionAlfanumerica = RegExp(r'([A-Za-z0-9]+(-[A-Za-z0-9]+)+)');
  return expresionAlfanumerica.hasMatch(textoValidar);
}

bool validarCampoLetrasEspacios(String textoValidar) {
  RegExp expresionLetras = RegExp(r'([a-zA-Z]+( [a-zA-Z]+)+)');
  return expresionLetras.hasMatch(textoValidar);
}

bool validarCampoLetrasGuiones(String textoValidar) {
  RegExp expresionLetras = RegExp(r'([a-zA-Z]+(-[a-zA-Z]+)+)');
  return expresionLetras.hasMatch(textoValidar);
}

bool validarCampoNumeroEntero(String textoValidar) {
  RegExp expresionLetras = RegExp(r'^[0-9]+$');
  return expresionLetras.hasMatch(textoValidar);
}

bool validarCampoNumeroDecimal(String textoValidar) {
  RegExp expresionDecimal = RegExp(r'[0-9]*\.[0-9]+');
  return expresionDecimal.hasMatch(textoValidar);
}

bool validarCorreoElectronico(String textoValidar) {
  RegExp expresionCorreo = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  return expresionCorreo.hasMatch(textoValidar);
}

main() {
  print(validarCampoAlfanumericoEspacios("HP Pavilion G4 2805 la"));
  print(validarCampoAlfanumericoGuiones("texto-Validar"));
  print(validarCampoAlfanumericoSinEspacios("texto-Validar"));

  print(validarCampoLetrasEspacios("Hector David Madrid Rivera"));
  print(validarCampoLetrasGuiones("ABCDE-FGHIJK"));
  print(validarCampoLetrasSinEspacios("ABCDE"));

  print(validarCampoNumeroEntero("1234567890"));
  print(validarCampoNumeroDecimal("3.1416"));
  print(validarCorreoElectronico("hector.morelos.607@gmail.com"));
}

//[a-zA-Z]+/x