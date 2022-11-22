class Catalogo {
  late String idRegistro;
  late String modelo;

  Catalogo();

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setModelo(String modelo) {
    this.modelo = modelo;
  }

  String getIdRegistro() => idRegistro;
  String getModelo() => modelo;
}
