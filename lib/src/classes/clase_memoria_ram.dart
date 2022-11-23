import 'dart:math';

class MemoriaRam {
  late String idRegistro;
  late String modelo;
  late String marca;
  late String tipoMemoria;
  late int cantidadMemoria;
  late int cantidadMemorias;
  late int velocidad;
  late int ecc;

  MemoriaRam();

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
}
