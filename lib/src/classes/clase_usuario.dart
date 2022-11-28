class Usuario {
  late String nombreUsuario;
  late String nombre;
  late String apellido;
  late String correoElectronico;
  late String contrasena;
  late int administrador;

  Usuario(
    this.nombreUsuario,
    this.nombre,
    this.apellido,
    this.correoElectronico,
    this.contrasena,
    this.administrador,
  );

  void setNombreUsuario(String nombreUsuario) {
    this.nombreUsuario = nombreUsuario;
  }

  void setNombre(String nombre) {
    this.nombre = nombre;
  }

  void setApellido(String apellido) {
    this.apellido = apellido;
  }

  void setCorreoElectronico(String correoElectronico) {
    this.correoElectronico = correoElectronico;
  }

  void setContrasena(String contrasena) {
    this.contrasena = contrasena;
  }

  void setAdministrador(int administrador) {
    this.administrador = administrador;
  }

  String getPermisos() {
    if (administrador == 1) {
      return "Si";
    }
    return "No";
  }

  String getNombreUsuario() => nombreUsuario;
  String getNombre() => nombre;
  String getApellido() => apellido;
  String getCorreoElectronico() => correoElectronico;
  String getContrasena() => contrasena;
  int getAdministrador() => administrador;

  @override
  String toString() {
    return "Nombre de usuario: $nombreUsuario\nNombre: $nombre"
        "\nApellido: $correoElectronico\nCorreo electronico: $correoElectronico"
        "\nContraseña $contrasena\nAdministrador: ${getPermisos()}";
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      json['nombreUsuario'],
      json['nombre'],
      json['apellido'],
      json['correoElectronico'],
      json['contrasena'],
      json['administrador'],
    );
  }
}
