class Hdd {
  late String idRegistro;
  late String marca;
  late String modelo;
  late int capacidad;
  late String interfaz;
  late int cache;
  late int revoluciones;
  late String tamanio;

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
}
