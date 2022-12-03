class Ssd {
  late String idRegistro;
  late String marca;
  late String modelo;
  late int capacidad;
  late String factorForma;
  late String durabilidad;
  late String tipoMemorias;
  late String generacionMemorias;
  late String velocidadLectura;
  late String velocidadEscritura;
  late String protocolo;

  Ssd(
    this.idRegistro,
    this.marca,
    this.modelo,
    this.capacidad,
    this.factorForma,
    this.durabilidad,
    this.tipoMemorias,
    this.generacionMemorias,
    this.velocidadLectura,
    this.velocidadEscritura,
    this.protocolo,
  );

  Ssd.ssdVacio(
      {this.marca = "ND",
      this.modelo = "ND",
      this.capacidad = 0,
      this.factorForma = "ND",
      this.durabilidad = "ND",
      this.tipoMemorias = "ND",
      this.generacionMemorias = "ND",
      this.velocidadLectura = "ND",
      this.velocidadEscritura = "ND",
      this.protocolo = "ND"});

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setMarca(String marca) {
    this.marca = marca;
  }

  void setModelo(String modelo) {
    this.modelo = modelo;
  }

  void setCapacidad(int capacidad) {
    this.capacidad = capacidad;
  }

  void setFactorForma(String factorForma) {
    this.factorForma = factorForma;
  }

  void setDurabilidad(String durabilidad) {
    this.durabilidad = durabilidad;
  }

  void setTipoMemorias(String tipoMemorias) {
    this.tipoMemorias = tipoMemorias;
  }

  void setGeneracionMemorias(String generacionMemorias) {
    this.generacionMemorias = generacionMemorias;
  }

  void setVelocidadLectura(String velocidadLectura) {
    this.velocidadLectura = velocidadLectura;
  }

  void setVelocidadEscritura(String velocidadEscritura) {
    this.velocidadEscritura = velocidadEscritura;
  }

  void setProtocolo(String protocolo) {
    this.protocolo = protocolo;
  }

  String getIdRegistro() => idRegistro;
  String getMarca() => marca;
  String getModelo() => modelo;
  int getCapacidad() => capacidad;
  String getFactorForma() => factorForma;
  String getDurabilidad() => durabilidad;
  String getTipoMemorias() => tipoMemorias;
  String getGeneracionMemorias() => generacionMemorias;
  String getVelocidadLectura() => velocidadLectura;
  String getVelocidadEscritura() => velocidadEscritura;
  String getProtocolo() => protocolo;

  @override
  String toString() {
    return "Marca: $marca\nModelo: $modelo\ncapacidad: $capacidad"
        "Factor de forma: $factorForma\nDurabilidad: $durabilidad"
        "tipo de memorias: $tipoMemorias"
        "\nGeneracion de memorias: $generacionMemorias"
        "Velocidad de lectura: $velocidadLectura"
        "Velocidad de escritura: $velocidadEscritura"
        "Protocolo de transferencia: $protocolo";
  }

  factory Ssd.fromJson(Map<String, dynamic> json) {
    return Ssd(
      json['idRegistro'],
      json['marca'],
      json['modelo'],
      json['capacidad'],
      json['factorForma'],
      json['durabilidad'],
      json['tipoMemorias'],
      json['generacionMemorias'],
      json['velocidadLectura'],
      json['velocidadEscritura'],
      json['protocolo'],
    );
  }
}
