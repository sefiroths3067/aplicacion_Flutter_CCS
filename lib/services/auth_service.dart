import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'ccsapi.herokuapp.com';
  //final String _firebaseToken = 'AIzaSyBcytoCbDUARrX8eHpcR-Bdrdq0yUmSjf8';

  final storage = new FlutterSecureStorage();

  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> createUser(String rut, String nombres, String apellidos,
      String email, String password, String? contacto) async {
    final Map<String, dynamic> authData = {
      'rut': rut,
      'nombres': nombres,
      'apellidos': apellidos,
      'email': email,
      'password': password,
      'contacto': contacto,
      'returnSecureToken': true
    };
    print(authData);

    final url = Uri.https(_baseUrl, '/api/registro/');
    print(url);
    final resp = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('id')) {
      // Token hay que guardarlo en un lugar seguro
      // await storage.write(key: 'token', value: decodedResp['idToken']);
      // print(decodedResp);
      decodedResp['idToken'];
      return null;
    } else {
      return 'rut y/o email ya existe';
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(_baseUrl, '/api/login/');
    print(url);

    final resp = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));

    final decodedResp = json.decode(resp.body);
    print(decodedResp);

    // if (decodedResp('token')) {
    //   // Token hay que guardarlo en un lugar seguro
    //   // decodedResp['idToken'];
    //   await storage.write(key: 'token', value: decodedResp['token']);

    //   return null;
    // } else {
    //   return decodedResp['error'];
    // }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<String?> updateUser(String rut, String nombres, String apellidos,
      String email, String password, String? contacto) async {
    final Map<String, dynamic> authData = {
      'rut': rut,
      'nombres': nombres,
      'apellidos': apellidos,
      'email': email,
      'password': password,
      'contacto': contacto,
      'returnSecureToken': true
    };
    print(authData);

    final url = Uri.https(_baseUrl, '/api/cliente/{id}/');
    print(url);
    final resp = await http.put(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('id')) {
      // Token hay que guardarlo en un lugar seguro
      // await storage.write(key: 'token', value: decodedResp['idToken']);
      // print(decodedResp);
      // decodedResp['idToken'];
      return null;
    } else {
      return 'rut y/o email ya existe';
    }
  }

  Future<String?> createShedule(String fecha, String estado) async {
    final Map<String, dynamic> authData = {
      'fecha': fecha,
      'estado': estado,
      'returnSecureToken': true
    };
    print(authData);

    final url = Uri.https(_baseUrl, '/api/agenda/');
    print(url);
    final resp = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('id')) {
      // Token hay que guardarlo en un lugar seguro
      // await storage.write(key: 'token', value: decodedResp['idToken']);
      // print(decodedResp);
      // decodedResp['idToken'];
      return null;
    } else {
      return 'rut y/o email ya existe';
    }
  }

  Future<String?> reservations(String fecha, String hora) async {
    final Map<String, dynamic> authData = {
      'fecha': fecha,
      'hora': hora,
      'returnSecureToken': true
    };
    print(authData);

    final url = Uri.https(_baseUrl, '/api/registro/');
    print(url);
    final resp = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('id')) {
      // Token hay que guardarlo en un lugar seguro
      // await storage.write(key: 'token', value: decodedResp['idToken']);
      // print(decodedResp);
      // decodedResp['idToken'];
      return null;
    } else {
      return 'rut y/o email ya existe';
    }
  }

  Future<String?> claims(String reclamo, String sugerencia) async {
    final Map<String, dynamic> authData = {
      'reclamo': reclamo,
      'sugerencia': sugerencia,
      'returnSecureToken': true
    };
    print(authData);

    final url = Uri.https(_baseUrl, '/api/registro/');
    print(url);
    final resp = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('id')) {
      // Token hay que guardarlo en un lugar seguro
      // await storage.write(key: 'token', value: decodedResp['idToken']);
      // print(decodedResp);
      // decodedResp['idToken'];
      return null;
    } else {
      return 'rut y/o email ya existe';
    }
  }

  Future<String?> gimnasiosGet(String fecha, String hora) async {
    final Map<String, dynamic> authData = {
      'fecha': fecha,
      'hora': hora,
      'returnSecureToken': true
    };
    print(authData);

    final url = Uri.https(_baseUrl, '/api/local/');
    print(url);
    final resp = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('id')) {
      // Token hay que guardarlo en un lugar seguro
      // await storage.write(key: 'token', value: decodedResp['idToken']);
      // print(decodedResp);
      // decodedResp['idToken'];
      return null;
    } else {
      return 'rut y/o email ya existe';
    }
  }
}
