import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class SucursalesService extends ChangeNotifier {
  final String _baseUrl = 'ccsapi.herokuapp.com';
  final List<Sucursales> sucursales = [];
  bool isLoading = true;

  SucursalesService() {
    this.loadSucursales();
  }

  Future loadSucursales() async {
    final url = Uri.http(_baseUrl, '/api/local/');
    final resp = await http.get(url);

    final sucursalesMap = json.decode(resp.body);

    print(sucursalesMap);
  }
}
