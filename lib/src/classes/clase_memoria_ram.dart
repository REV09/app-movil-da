class MemoriaRam {
  late String idRegistro;
  late String modelo;
  late String marca;
  late String tipoMemoria;
  late int cantidadMemoria;
  late int cantidadMemorias;
  late int velocidad;
  late int ecc;

  MemoriaRam.memoriaVacia({
    this.modelo = "ND",
    this.marca = "ND",
    this.tipoMemoria = "ND",
    this.cantidadMemoria = 0,
    this.cantidadMemorias = 0,
    this.velocidad = 0,
    this.ecc = 0,
  });

  MemoriaRam(this.idRegistro, this.modelo, this.marca, this.tipoMemoria,
      this.cantidadMemoria, this.cantidadMemorias, this.velocidad, this.ecc);

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setModelo(String modelo) {
    this.modelo = modelo;
  }

  void setMarca(String marca) {
    this.marca = marca;
  }

  void setTipoMemoria(String tipoMemoria) {
    this.tipoMemoria = tipoMemoria;
  }

  void setCantidadMemoria(int cantidadMemoria) {
    this.cantidadMemoria = cantidadMemoria;
  }

  void setCantidadMemorias(int cantidadMemorias) {
    this.cantidadMemorias = cantidadMemorias;
  }

  void setVelocidad(int velocidad) {
    this.velocidad = velocidad;
  }

  void setEcc(int ecc) {
    this.ecc == ecc;
  }

  String getIdRegistro() => idRegistro;
  String getModelo() => modelo;
  String getMarca() => marca;
  String getTipoMemoria() => tipoMemoria;
  int getCantidadMemoria() => cantidadMemoria;
  int getCantidadMemorias() => cantidadMemorias;
  int getVelocidad() => velocidad;
  int getEcc() => ecc;

  @override
  String toString() {
    return "Marca: $marca\nModelo: $modelo\nTipo de memoria: $tipoMemoria"
        "\nCantidad de memoria: $cantidadMemoria"
        "\nNumero de memorias: $cantidadMemorias\nVelocidad: $velocidad"
        "\nECC: $ecc";
  }

  factory MemoriaRam.fromJson(Map<String, dynamic> json) {
    return MemoriaRam(
      json['idRegistro'],
      json['modelo'],
      json['marca'],
      json['tipoMemoria'],
      json['cantidadMemoria'],
      json['cantidadMemorias'],
      json['velocidad'],
      json['ecc'],
    );
  }
}
