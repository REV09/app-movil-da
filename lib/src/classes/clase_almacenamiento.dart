class Almacenamiento {
  late String idRegistro;
  late String tipoAlmacenamiento;

  Almacenamiento();

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setTipoAlmacenamiento(String tipoAlmacenamiento) {
    this.tipoAlmacenamiento = tipoAlmacenamiento;
  }

  String getIdRegistro() => idRegistro;
  String getTipoAlmacenamiento() => tipoAlmacenamiento;
}
