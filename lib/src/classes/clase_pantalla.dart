class Pantalla {
  late String idRegistro;
  late String modelo;
  late String resolucion;
  late String calidad;
  late String tipoPantalla;
  late String tamanio;
  late int frecuenciaRefresco;

  Pantalla(
    this.idRegistro,
    this.modelo,
    this.resolucion,
    this.calidad,
    this.tipoPantalla,
    this.tamanio,
    this.frecuenciaRefresco,
  );

  Pantalla.pantallaVacia(
      {this.modelo = "ND",
      this.resolucion = "ND",
      this.calidad = "ND",
      this.tipoPantalla = "ND",
      this.tamanio = "ND",
      this.frecuenciaRefresco = 0});

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setModelo(String modelo) {
    this.modelo = modelo;
  }

  void setResolucion(String resolucion) {
    this.resolucion = resolucion;
  }

  void setCalidad(String calidad) {
    this.calidad = calidad;
  }

  void setTipoPantalla(String tipoPantalla) {
    this.tipoPantalla = tipoPantalla;
  }

  void setTamanio(String tamanio) {
    this.tamanio = tamanio;
  }

  void setFrecuenciaRefresco(int frecuenciaRefresco) {
    this.frecuenciaRefresco = frecuenciaRefresco;
  }

  String getIdRegistro() => idRegistro;
  String getModelo() => modelo;
  String getResolucion() => resolucion;
  String getCalidad() => calidad;
  String getTipoPantalla() => tipoPantalla;
  String getTamanio() => tamanio;
  int getFrecuenciaRefresco() => frecuenciaRefresco;

  factory Pantalla.fromJson(Map<String, dynamic> json) {
    return Pantalla(
      json['idRegistro'],
      json['modelo'],
      json['resolucion'],
      json['calidad'],
      json['tipoPantalla'],
      json['tamanio'],
      json['frecuenciaRefresco'],
    );
  }
}
