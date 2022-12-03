class Laptop {
  late String idRegistro;
  late String modelo;
  late String memoriaRam;
  late String tarjetaVideo;
  late String pantalla;
  late String procesador;
  late String almacenamiento;

  Laptop.sinParametros();

  Laptop.laptopVacia(
      {this.idRegistro = "ND",
      this.modelo = "ND",
      this.memoriaRam = "ND",
      this.tarjetaVideo = "ND",
      this.pantalla = "ND",
      this.procesador = "ND",
      this.almacenamiento = "ND"});

  Laptop(this.idRegistro, this.modelo, this.memoriaRam, this.tarjetaVideo,
      this.pantalla, this.procesador, this.almacenamiento);

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setModelo(String modelo) {
    this.modelo = modelo;
  }

  void setMemoriaRam(String memoriaRam) {
    this.memoriaRam = memoriaRam;
  }

  void setTarjetaVideo(String tarjetaVideo) {
    this.tarjetaVideo = tarjetaVideo;
  }

  void setPantalla(String pantalla) {
    this.pantalla = pantalla;
  }

  void setProcesador(String procesador) {
    this.procesador = procesador;
  }

  void setAlmacenamiento(String almacenamiento) {
    this.almacenamiento = almacenamiento;
  }

  String getIdRegistro() => idRegistro;
  String getModelo() => modelo;
  String getMemoriaRam() => memoriaRam;
  String getTarjetaVideo() => tarjetaVideo;
  String getPantalla() => pantalla;
  String getProcesador() => procesador;
  String getAlmacenamiento() => almacenamiento;

  @override
  String toString() {
    return "ID de registro: $idRegistro\nModelo: $modelo"
        "\nMemoria Ram: $memoriaRam\nTarjeta de video: $tarjetaVideo"
        "\nPantalla: $pantalla\nProcesador: $procesador"
        "\nAlmacenamiento: $almacenamiento";
  }

  factory Laptop.fromJson(Map<String, dynamic> json) {
    return Laptop(
      json['idRegistro'],
      json['modelo'],
      json['memoriaRam'],
      json['tarjetaVideo'],
      json['pantalla'],
      json['procesador'],
      json['almacenamiento'],
    );
  }
}
