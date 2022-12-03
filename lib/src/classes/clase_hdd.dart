class Hdd {
  late String idRegistro;
  late String marca;
  late String modelo;
  late int capacidad;
  late String interfaz;
  late int cache;
  late int revoluciones;
  late String tamanio;

  Hdd(
    this.idRegistro,
    this.marca,
    this.modelo,
    this.capacidad,
    this.interfaz,
    this.cache,
    this.revoluciones,
    this.tamanio,
  );

  Hdd.vacio(
      {this.marca = "ND",
      this.modelo = "ND",
      this.capacidad = 0,
      this.interfaz = "ND",
      this.cache = 0,
      this.revoluciones = 0,
      this.tamanio = "ND"});

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

  void setInterfaz(String interfaz) {
    this.interfaz = interfaz;
  }

  void setCache(int cache) {
    this.cache = cache;
  }

  void setRevoluciones(int revoluciones) {
    this.revoluciones = revoluciones;
  }

  void setTamanio(String tamanio) {
    this.tamanio = tamanio;
  }

  String getIdRegistro() => idRegistro;
  String getMarca() => marca;
  String getModelo() => modelo;
  int getCapacidad() => capacidad;
  String getInterfaz() => interfaz;
  int getCache() => cache;
  int getRevoluciones() => revoluciones;
  String getTamanio() => tamanio;

  factory Hdd.fromJson(Map<String, dynamic> json) {
    return Hdd(
        json['idRegistro'],
        json['marca'],
        json['modelo'],
        json['capacidad'],
        json['interfaz'],
        json['cache'],
        json['revoluciones'],
        json['tamanio']);
  }
}
