class Procesador {
  late String idRegistro;
  late String modelo;
  late String marca;
  late int numeroNucleos;
  late int numeroHilos;
  late double velocidadMaxima;
  late double velocidadMinima;
  late int litografia;

  Procesador.procesadorVacio({
    this.idRegistro = "",
    this.modelo = "",
    this.marca = "",
    this.numeroNucleos = 0,
    this.numeroHilos = 0,
    this.velocidadMaxima = 0,
    this.velocidadMinima = 0,
    this.litografia = 0,
  });

  Procesador(
    this.idRegistro,
    this.modelo,
    this.marca,
    this.numeroNucleos,
    this.numeroHilos,
    this.velocidadMaxima,
    this.velocidadMinima,
    this.litografia,
  );

  void setIdRegistro(String idRegistro) {
    this.idRegistro = idRegistro;
  }

  void setModelo(String modelo) {
    this.modelo = modelo;
  }

  void setMarca(String marca) {
    this.marca = marca;
  }

  void setNumeroNucleos(int numeroNucleos) {
    this.numeroNucleos = numeroNucleos;
  }

  void setNumeroHilos(int numeroHilos) {
    this.numeroHilos = numeroHilos;
  }

  void setVelocidadMaxima(double velocidadMaxima) {
    this.velocidadMaxima = velocidadMaxima;
  }

  void setVelocidadMinima(double velocidadMinima) {
    this.velocidadMinima = velocidadMinima;
  }

  void setLitografia(int litografia) {
    this.litografia = litografia;
  }

  String getIdRegistro() => idRegistro;
  String getModelo() => modelo;
  String getMarca() => marca;
  int getNumeroNucleos() => numeroNucleos;
  int getNumeroHilos() => numeroHilos;
  double getVelocidadMaxima() => velocidadMaxima;
  double getVelocidadMinima() => velocidadMinima;
  int getLitografia() => litografia;

  @override
  String toString() {
    return "Modelo: ${modelo}\nMarca: ${marca}\nNumero de nucleos: ${numeroNucleos}" +
        "\nNumero de hilos: ${numeroHilos}\nvelocidad maxima: ${velocidadMaxima}" +
        "\nvelocidad minima: ${velocidadMinima}\nLitografia: ${litografia}";
  }

  factory Procesador.fromJson(Map<String, dynamic> json) {
    return Procesador(
      json['idRegistro'],
      json['modelo'],
      json['marca'],
      json['numeroNucleos'],
      json['numeroHilos'],
      json['velocidadMaxima'],
      json['velocidadMinima'],
      json['litografia'],
    );
  }
}
