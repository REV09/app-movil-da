class TarjetaVideo {
  late String idRegistro;
  late String modelo;
  late String marca;
  late int cantidadVram;
  late String tipoMemoria;
  late int bits;
  late double velocidadReloj;
  late String tipo;

  TarjetaVideo(
    this.idRegistro,
    this.modelo,
    this.marca,
    this.cantidadVram,
    this.tipoMemoria,
    this.bits,
    this.velocidadReloj,
    this.tipo,
  );

  TarjetaVideo.tarjetaVideoVacia(
      {this.modelo = "ND",
      this.marca = "ND",
      this.cantidadVram = 0,
      this.tipoMemoria = "ND",
      this.bits = 0,
      this.velocidadReloj = 0,
      this.tipo = "ND"});

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setModelo(String modelo) {
    this.modelo = modelo;
  }

  void setMarca(String marca) {
    this.marca = marca;
  }

  void setCantidadVram(int cantidadVram) {
    this.cantidadVram = cantidadVram;
  }

  void setTipoMemoria(String tipoMemoria) {
    this.tipoMemoria = tipoMemoria;
  }

  void setBits(int bits) {
    this.bits = bits;
  }

  void setVelocidadReloj(double velocidadReloj) {
    this.velocidadReloj = velocidadReloj;
  }

  void setTipo(String tipo) {
    this.tipo = tipo;
  }

  String getIdRegistro() => idRegistro;
  String getModelo() => modelo;
  String getMarca() => marca;
  int getCantidadVram() => cantidadVram;
  String getTipoMemoria() => tipoMemoria;
  int getBits() => bits;
  double getVelocidadReloj() => velocidadReloj;
  String getTipo() => tipo;

  @override
  String toString() {
    return "Marca: $marca\nModelo: $modelo\nCantidad de Vran: $cantidadVram"
        "\ntipo de memoria: $tipoMemoria\nBits de trabajo: $bits"
        "Velocidad de reloj: $velocidadReloj\nTipo de grafica: $tipo";
  }

  factory TarjetaVideo.fromJson(Map<String, dynamic> json) {
    return TarjetaVideo(
      json['idRegistro'],
      json['modelo'],
      json['marca'],
      json['cantidadVram'],
      json['tipoMemoria'],
      json['bits'],
      json['velocidadReloj'],
      json['tipo'],
    );
  }
}
