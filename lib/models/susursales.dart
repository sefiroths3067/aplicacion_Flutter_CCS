import 'dart:convert';

class Sucursales {
  Sucursales({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.contacto,
    this.imagen,
    this.aforoMaximo,
    this.aforoActual,
  });

  String id;
  String nombre;
  String direccion;
  int contacto;
  String? imagen;
  int? aforoMaximo;
  int? aforoActual;

  factory Sucursales.fromJson(String str) =>
      Sucursales.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sucursales.fromMap(Map<String, dynamic> json) => Sucursales(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        contacto: json["contacto"],
        imagen: json["imagen"],
        aforoMaximo: json["aforo_maximo"],
        aforoActual: json["aforo_actual"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "contacto": contacto,
        "imagen": imagen,
        "aforo_maximo": aforoMaximo,
        "aforo_actual": aforoActual,
      };
}
