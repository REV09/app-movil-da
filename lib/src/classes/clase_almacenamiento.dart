class Almacenamiento {
  late String idRegistro;
  late String tipoAlmacenamiento;

  Almacenamiento(this.idRegistro, this.tipoAlmacenamiento);

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setTipoAlmacenamiento(String tipoAlmacenamiento) {
    this.tipoAlmacenamiento = tipoAlmacenamiento;
  }

  String getIdRegistro() => idRegistro;
  String getTipoAlmacenamiento() => tipoAlmacenamiento;

  factory Almacenamiento.fromJson(Map<String, dynamic> json) {
    return Almacenamiento(json['idRegistro'], json['tipoAlmacenamiento']);
  }
}
