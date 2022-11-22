class Laptop {
  late String idRegistro;
  late String modelo;
  late String memoriaRam;
  late String tarjetaVideo;
  late String pantalla;
  late String procesador;
  late String almacenamiento;

  Laptop();

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
}
